function [registered] = match_ROIs_V2(path_dir,crossdir)

%V2 - makes path for python universal regardless of crossdir input

%match ROIs using register ROI from CNMF (matlab) and match ROIs across
%session using Python Caiman register_multisession function

%inputs
%cell with directories of each session from single FOV

%% Read in directory list
%directories containing the output of CNMF from each exp

%directory path that can be used with fprintf for python config file
split_crossdir = split(crossdir,'\');
%create empty path
crossdir_config = [];
for ii =1:size(split_crossdir,1)
    if ii < size(split_crossdir,1)
    crossdir_config = [crossdir_config, split_crossdir{ii},'\\'];
    elseif ii == size(split_crossdir,1)
    crossdir_config = [crossdir_config, split_crossdir{ii}];    
    end
end

%crossdir_config = 'E:\\I42L_AB_1\\crossDay';

%get the names of the mat files
for ii=1:size(path_dir,2)
    filenam(ii) = dir([path_dir{ii},'\input\*.mat']);
end

%navigate to save directory (cross session directory)
cd(crossdir)
%make python input and output directory
mkdir('python_input');
mkdir('python_output');

%% Read in template and A_keep matrix

%load in removed ROIs
for ii=1:size(path_dir,2)
    %get path name
    session_files_removedROI{ii} = subdir(fullfile(path_dir{ii},'removedROI','*selectedROIs.mat'));
    %load in the logical list of components
    somaticROI{ii} = load(session_files_removedROI{ii}.name,'compSelect');
end

%load all the remaining data for session-by-session comp registration
tic;
for ii=1:size(path_dir,2) %for each session
    session_vars{ii} = load(fullfile(filenam(ii).folder,filenam(ii).name),'A_keep','C_full','options_mc','options','dims','Coor_kp','expDffMedZeroed', 'template');
    
    %load template (for later datasets)
    template{ii} = load(fullfile(path_dir{ii},'template_nr.mat'));
    session_vars{ii}.template = template{ii}.template;
    
    %get keep centers
    session_vars{ii}.centers = com(session_vars{ii}.A_keep,session_vars{ii}.dims(1),session_vars{ii}.dims(2));
end
toc;

%% Set the registration options parameters

% options                 parameter structure with inputs:
%       d1:               number of rows in FOV
options.d1 = session_vars{1}.dims(1);
%       d2:               number of columns in FOV
options.d2 = session_vars{1}.dims(2);
%       options_mc:       motion correction options
options.options_mc = session_vars{1}.options_mc;
%       plot_reg:         create a contour plot of registered ROIs
options.plot_reg = true;

%TINKER WITH THESE PARAMETERS - works well out of the box

%       d3:               number of planes in FOV (default: 1)
%       dist_maxthr:      threshold for turning spatial components into binary masks (default: 0.1)
%       dist_exp:         power n for distance between masked components: dist = 1 - (and(m1,m2)/or(m1,m2))^n (default: 1)
%       dist_thr:         threshold for setting a distance to infinity. (default: 0.5)
%       dist_overlap_thr: overlap threshold for detecting if one ROI is a subset of another (default: 0.8)


%       options_mc:       motion correction options
options_mc = session_vars{1}.options_mc;

%correct filename for unix notation
mc_filename = split(options_mc.h5_filename,'/');
options_mc.h5_filename = mc_filename{1};

%% Remove non-somatic componenets

for ii=1:size(path_dir,2)
    compSelect = somaticROI{ii}.compSelect;
    session_vars{ii}.A_keep = session_vars{ii}.A_keep(:,compSelect);
    session_vars{ii}.C_full = session_vars{ii}.C_full(compSelect,:);
    session_vars{ii}.Coor_kp = session_vars{ii}.Coor_kp(compSelect);
    session_vars{ii}.expDffMedZeroed = session_vars{ii}.expDffMedZeroed(compSelect,:);
    session_vars{ii}.centers = session_vars{ii}.centers(compSelect,:);
end

%% Session-by-session registration - create cross match matrix

%define lookup matrix for which combinations to run
lookup_match = triu(ones(size(path_dir,2)),1);

%define equivalent empty cell to store output from component registration
register = cell(size(path_dir,2),size(path_dir,2));

tic;
for ii=1:size(path_dir,2)
    disp([num2str(ii), '/',num2str(size(path_dir,2))]);
    for jj=1:size(path_dir,2)
        
        %check that this combination is to be evaluated
        if lookup_match(ii,jj) == 1
            %define spatial componenets from session 1
            A1 = session_vars{ii}.A_keep;
            %define spatial componenets from session 1
            A2 = session_vars{jj}.A_keep;
            %define the templates
            template1 = session_vars{ii}.template;
            template2 = session_vars{jj}.template;
            
%             [register{ii,jj}.matched_ROIs,register{ii,jj}.nonmatched_1,register{ii,jj}.nonmatched_2,register{ii,jj}.Aout,register{ii,jj}.R,register{ii,jj}.A_union] = ...
%                 register_ROIs(A1,A2,options,template1,template2,options_mc);

            %save memory by excluding some outputs
            [register{ii,jj}.matched_ROIs,register{ii,jj}.nonmatched_1,register{ii,jj}.nonmatched_2,~,~,~] = ...
                register_ROIs(A1,A2,options,template1,template2,options_mc);
        end
    end
end
toc;


%% Export to python for multisession registration / remove manually discarded ROIs
% Read in A matrices, remove discarded components, and save to mat for processing in Python
% use different template read-in for current datasets
A= {};
for ii=1:size(path_dir,2)
    %load in A matrices
    load(fullfile(filenam(ii).folder,filenam(ii).name),'A_keep');
    %convert to full type
    A_keep = full(A_keep);
    
    %remove ROIs that were discarded
    A_keep = A_keep(:,somaticROI{ii}.compSelect);
    
    %save each session A for later visualization (after removed ROIs)
    A{ii} = A_keep;
    
    %load in templates
    load(fullfile(filenam(ii).folder,filenam(ii).name),'template');
    
    %save A_keep and templates for each session in numerical order
    save(fullfile(crossdir,'python_input',[num2str(ii),'.mat']),'A_keep','template')
end

%% Create config file for python to know cross session directory
fileID = fopen(['D:\python_scripts\','crossSesParams.config'], 'w');
%split each absolute location directory into subpart delimited by /
%splitName = strsplit(names{ii},'/');

fprintf(fileID,'[fileNames]\n\n');
fprintf(fileID,['exp_cross_name: ',crossdir_config, '\n']);

%close text file
fclose(fileID);


%% Execute python scripts from windows command line

%run bat script that load base/caiman environment and executes registration
%script
[stat,cmd_out] = system('D:\python_scripts\launch_python_script.bat','-echo');

%% Read python caiman register function output variables

%navigate to cross session working directory for experiment
cd(crossdir)

%load in python output variables
load(fullfile(crossdir,'python_output','matching_output.mat'))

%account for python 1 index offset (run once)
assignments_adj = assignments + 1;

%components that match across all sessions
all_match_sum = sum(assignments_adj,2);
assign_all_matching = assignments_adj(~isnan(all_match_sum),:);

%from all matching indices across sessions
%number of sessions
nbSes = size(assign_all_matching,2); 

%% Try plotting the matching A component - just visualization

%skip comparison of spatial components (temp)
if 0
figure;
for selComp =1:size(assign_all_matching,1)
    for ii=1:nbSes
        subplot(1,nbSes,ii)
        imagesc( reshape(A{ii}(:,assign_all_matching(selComp,ii)),512,512))
        title(num2str(selComp))
    end
    pause;
end

end

%% Define the outlines and x,y zoom-in limits for matched ROIs

[ROI_zooms,ROI_outlines] = defineOutlines(assign_all_matching,nbSes,session_vars);

%% Create a matching matrix for session by session registration equivalent to  
%matched ROIs - use lookup_match matrix
%save as that in register struct, but outside
matchedROIs = cell(size(path_dir,2),size(path_dir,2));

%move ROIs that are matched into each cell as matrix
for ii=1:size(path_dir,2)
    for jj=1:size(path_dir,2)
        
        %check that this combination is to be evaluated
        if lookup_match(ii,jj) == 1
            matchedROIs{ii,jj} = register{ii,jj}.matched_ROIs;
        end
    end
end

%for matching across all sessions (will miss some assignments)

%generate all matches
% [C, i2, i3] = intersect(matchedROIs{1,2}(:,1),matchedROIs{1,3}(:,1),'stable');
% 
% %combine into 1 matrix
% combineMatch(:,1) = matchedROIs{1,2}(i2,1);
% combineMatch(:,2) = matchedROIs{1,2}(i2,2);
% combineMatch(:,3) = matchedROIs{1,3}(i3,2);

%sort

%% Process output matrices/cells that assign ROIs to each other across days

%all matches across sessions
multiSessionAlign = assignments_adj;
%neurons that are only matched across all sessions
multiSessionAlign_all = assign_all_matching;

%cell from session by session matching
sesBySesMatchROIs = matchedROIs;

%cell with session-by-session match - should be redundant with
%multiSessionAlign

%preallocate
allSesMatchROIs = cell(size(path_dir,2),size(path_dir,2));
%move ROIs that are matched into each cell as matrix
for ii=1:size(path_dir,2)
    for jj=1:size(path_dir,2)
        
        %check that this combination is to be evaluated
        if lookup_match(ii,jj) == 1
            selectTemp = ~isnan(sum(multiSessionAlign(:,[ii jj]),2));
            
            allSesMatchROIs{ii,jj} = multiSessionAlign(selectTemp,[ii jj]);
        end
    end
end

%% Output data (struct)

%using register_multi script
registered.multi.assigned = multiSessionAlign;
registered.multi.assigned_all = multiSessionAlign_all;
registered.multi.assign_cell = allSesMatchROIs;
%ROI zooms and outlines for subsequent visualization %ROI_zooms,ROI_outlines
registered.multi.ROI_zooms = ROI_zooms;
registered.multi.ROI_outlines = ROI_outlines; 

%session-by-session matching
registered.session.assign_cell = sesBySesMatchROIs;






end

