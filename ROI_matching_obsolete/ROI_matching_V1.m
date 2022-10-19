
%% Read in directory list
%directories containing the output of CNMF from each exp
path_dir = {'E:\I42L_AB_1\I42L_AB_d1_032118_1',...
    'E:\I42L_AB_1\I42L_AB_d2_032218_1',...
    'E:\I42L_AB_1\I42L_AB_d3_032318_1'};

%get the names of the mat files
for ii=1:size(path_dir,2)
    filenam(ii) = dir([path_dir{ii},'\input\*.mat']);
end

%% Read in template and A_keep matrix

%navigate to save directory
savedir = 'E:\I42L_AB_1\crossDay';
cd(savedir)

%% Need to add preprocessing of A matrices for removal of selected componenets

%load in removed ROIs
for ii=1:size(path_dir,2)
    %get path name
    session_files_removedROI{ii} = subdir(fullfile(path_dir{ii},'removedROI','*selectedROIs.mat'));
    %load in the logical list of components
    somaticROI{ii} = load(session_files_removedROI{ii}.name,'compSelect');
end
   

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
    save([num2str(ii),'.mat'],'A_keep','template')
end


%% Read python caiman register function output variables

%navigate to cross session working directory for experiment
cd(savedir)

%load in python output variables
load('matching_output.mat')

%account for python 1 index offset (run once)
assignments_adj = assignments + 1;

%components that match across all sessions
all_match_sum = sum(assignments_adj,2);
assign_all_matching = assignments_adj(~isnan(all_match_sum),:);


%% Try plotting the matching A component

%generate list that matches components in ID'd space for each session

%for each union A id, search each session and get index of the component;
% %store in matrix (component x session matrix)
% matchList = [];
% 
% for ii=1:size(A_union,2)
%     for ss=1:3
%         find(matchings{ss} ==ii)
%     end
%     
% end


selComp = 109;

%from all index adjusted assignments
figure;
for ii=1:3
    subplot(1,3,ii)
    imagesc( reshape(A{ii}(:,assignments_adj(selComp,ii)),512,512))
end

%from all matching indices across sessions
figure;
for selComp =1:size(assign_all_matching,1)
    for ii=1:3
        subplot(1,3,ii)
        imagesc( reshape(A{ii}(:,assign_all_matching(selComp,ii)),512,512))
        title(num2str(selComp))
    end
    pause;
end

%% Check the component binaries for how they matched

%figure out what variables you need for this again - assemble into function


%turn this into GUI that allows exclusion of mismatched componenets

%plot zoomed in spatial component across 3 sessions
%plot outline of the id'd component
%plot the  associated trace 
%filter out neurons that are not matched

%concatenated components
compConcat = [];
%initialize flag variable for correction at edges of image
flagged = 0;

%for each selected ROI
for jj=1:size(combineMatch,1)
    %assign the matched ROIs across sessions
    ROI = combineMatch(jj,:);
    
    %for plotting each (debug)
    %figure;
    for ss =1:3
        %for plotting each (debug)
        %subplot(1,3,ss)
        %display template
        %imagesc(session_vars{ss}.template);
    
        %hold on
        %centers
        %scatter(session_vars{ss}.centers(ROI(ss),2),session_vars{ss}.centers(ROI(ss),1),'y*');
        %component outline
        %plot(session_vars{ss}.Coor_kp{ROI(ss)}(1,:),session_vars{ss}.Coor_kp{ROI(ss)}(2,:),'r', 'LineWidth',1);
        
        %zoom
        %xlim([session_vars{ss}.centers(ROI(ss),2)-60, session_vars{ss}.centers(ROI(ss),2)+60])
        %ylim([session_vars{ss}.centers(ROI(ss),1)-60, session_vars{ss}.centers(ROI(ss),1)+60])
        
        %get the rounded x and y range of the ROI of interest across
        %sessions
        yrange = [ceil(session_vars{ss}.centers(ROI(ss),2))-15, ceil(session_vars{ss}.centers(ROI(ss),2))+15];
        xrange = [ceil(session_vars{ss}.centers(ROI(ss),1))-15, ceil(session_vars{ss}.centers(ROI(ss),1))+15];
        
        %place each ROI zoom into a separate cell
        %if the area of interest if within range of the template
        if ~((sum(xrange < 1) > 0) || (sum(xrange > 512) > 0)) 
            if ~((sum(yrange < 1) > 0) || (sum(yrange > 512) > 0))
                disp(jj)
                ROI_zooms{jj,ss} = session_vars{ss}.template(xrange(1):xrange(2), yrange(1):yrange(2));
                %ROI outlines
                %create full-scale outline in a  sea of nans;
                ROI_outlines{jj,ss} = zeros(512,512);
                %create the binary outline
                %ROI_outlines{jj,ss}(session_vars{ss}.Coor_kp{ROI(ss)}(1,:)',session_vars{ss}.Coor_kp{ROI(ss)}(2,:)') = 1;
                ROI_outlines{jj,ss}(sub2ind([512,512],session_vars{ss}.Coor_kp{ROI(ss)}(2,:),session_vars{ss}.Coor_kp{ROI(ss)}(1,:))) =1;
                %clip the outline to match the field of of the ROI
                ROI_outlines{jj,ss} = ROI_outlines{jj,ss}(xrange(1):xrange(2), yrange(1):yrange(2));
                
            end
        end
        
        %adjust the xrange and yranges if beyond 1 or 512 
        %create blank 121x121 matrix and move the selected area into top
        %corner
        %determine which ranges are out of range
        xlow = xrange < 1;
        xhigh =  xrange > 512;
        ylow = yrange < 1;
        yhigh = yrange > 512;
        
        
        %set up conditional
        if xlow(1) ==1
            %xlowdiff = 
            xrange(1) = 1;
            flagged = 1;
        end
        if xlow(2) == 1
            xrange(2) = 1;
            flagged = 1;
        end
        if xhigh(1) ==1
            xrange(1) = 512;
            flagged = 1;
        end
        if xhigh(2) == 1
            xrange(2) = 512;
            flagged = 1;
        end
        if ylow(1) ==1
            yrange(1) = 1;
            flagged = 1;
        end
        if ylow(2) == 1
            yrange(2) = 1;
            flagged = 1;
        end
        if yhigh(1) ==1
            yrange(1) = 512;
            flagged = 1;
        end
        if yhigh(2) == 1
            yrange(2) = 512;
            flagged = 1;
        end
        
        %insert adjusted field
        if flagged == 1
            ROI_zooms{jj,ss} = zeros(15*2+1,15*2+1);
            ROI_zooms{jj,ss}(1:xrange(2)-xrange(1)+1, 1:yrange(2)-yrange(1)+1) = session_vars{ss}.template(xrange(1):xrange(2), yrange(1):yrange(2));
            %ROI outlines
            %create full-scale outline in a  sea of nans;
            %ROI_outlines{jj,ss} = nan(15*2+1,15*2+1);
            %create the binary outline
            ROI_outlines{jj,ss} = zeros(512,512);
            %create the binary outline
            %ROI_outlines{jj,ss}(session_vars{ss}.Coor_kp{ROI(ss)}(1,:)',session_vars{ss}.Coor_kp{ROI(ss)}(2,:)') = 1;
            ROI_outlines{jj,ss}(sub2ind([512,512],session_vars{ss}.Coor_kp{ROI(ss)}(2,:),session_vars{ss}.Coor_kp{ROI(ss)}(1,:))) =1;
            %store temp outline matrix
            temp = ROI_outlines{jj,ss};
            %set size with zeros
            ROI_outlines{jj,ss} = zeros(15*2+1,15*2+1);
            
            ROI_outlines{jj,ss}(1:xrange(2)-xrange(1)+1, 1:yrange(2)-yrange(1)+1) = temp(xrange(1):xrange(2), yrange(1):yrange(2));
        end
                   
                   
        %colormap
        %colormap( 'gray');
        %hold off
        
        %reset trim flag
        flagged = 0;
        
    end
end

%% Plot as one large group of subplots of ROI across sessions

%number of ROIs (rows) by sessions (cols)
rows = 20;
cols = 3;

%matrix corresponding to display
display_matrix = reshape([1:(rows*cols)],cols,rows)';

%total number of matched ROIs to display
displayROInb = size(ROI_zooms,1);

%ROI input list (in chunks of 20 start to finish
start_end_ROI = [(1:20:20*floor(displayROInb/20))',(20:20:20*floor(displayROInb/20))'];
start_end_ROI = [start_end_ROI; [start_end_ROI(end)+1, displayROInb]];

%iterate through each range
for iter=1:size(start_end_ROI,1)
    figure('renderer','painters','Position', [2200 100 300 900])
    %assign the roi range for display
ROI = start_end_ROI(iter,1):start_end_ROI(iter,2);

%for each sessions
for rr=1:size(display_matrix,1)
    for ss=1:size(display_matrix,2)
        subplot(rows,cols,display_matrix(rr,ss))
        subaxis(rows, cols, display_matrix(rr,ss), 'SpacingHorizontal', 0.01,...
          'SpacingVertical',0.01,...
           'MarginLeft',0.05,'MarginRight',0.05,'MarginTop',0,'MarginBottom',0.1);
       
        imagesc(ROI_zooms{ROI(rr) ,ss})
        hold on;
        colormap('gray')
        xticks([])
        yticks([])
        b= bwboundaries(ROI_outlines{ROI(rr),ss},'noholes');
        plot(b{1}(:,2),b{1}(:,1),'r')
        hold off
    end
end

end



