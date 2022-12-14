%% Define the directories for processing

%ANIMAL #1
%I42R 1
path_dir{1} = {'G:\OCGOL_stability_recall\I42R_1\I42R_AB_d1_032118_1',...
    'G:\OCGOL_stability_recall\I42R_1\I42R_AB_d2_032218_2',...
    'G:\OCGOL_stability_recall\I42R_1\I42R_AB_d3_032318_3',...
    'G:\OCGOL_stability_recall\I42R_1\I42R_AB_d6_032618_4_2',...
    'G:\OCGOL_stability_recall\I42R_1\I42R_AB_d7_032718_5',...
    'G:\OCGOL_stability_recall\I42R_1\I42R_AB_d8_032818_6',...
    'G:\OCGOL_stability_recall\I42R_1\I42R_AB_d9_032918_7'};
%cross session directory
crossdir{1} = 'G:\OCGOL_stability_recall\I42R_1\crossSession';

%ANIMAL #2
% I46
path_dir{2} = {'G:\OCGOL_stability_recall\I46\I46_AB_d1_062018_1',...
     'G:\OCGOL_stability_recall\I46\I46_AB_d2_062118_2',...
     'G:\OCGOL_stability_recall\I46\I46_AB_d3_062218_3',...
     'G:\OCGOL_stability_recall\I46\I46_AB_d6_062518_4',...
     'G:\OCGOL_stability_recall\I46\I46_AB_d7_062618_5',...
     'G:\OCGOL_stability_recall\I46\I46_AB_d8_062718_6',...
     'G:\OCGOL_stability_recall\I46\I46_AB_d9_062818_7'};
%cross session directory
crossdir{2} = 'G:\OCGOL_stability_recall\I46\crossSession';

%ANIMAL #3
%I45
path_dir{3} = {'G:\OCGOL_stability_recall\I45_RT\I45_RT_AB_d1_062018_1',...
    'G:\OCGOL_stability_recall\I45_RT\I45_RT_AB_d2_062118_2',...
    'G:\OCGOL_stability_recall\I45_RT\I45_RT_AB_d3_062218_3',...
    'G:\OCGOL_stability_recall\I45_RT\I45_RT_AB_d6_062518_4',...
    'G:\OCGOL_stability_recall\I45_RT\I45_RT_AB_d7_062618_5',...
    'G:\OCGOL_stability_recall\I45_RT\I45_RT_AB_d8_062718_6',...
    'G:\OCGOL_stability_recall\I45_RT\I45_RT_AB_d9_062818_7'};
%cross session directory
crossdir{3} = 'G:\OCGOL_stability_recall\I45_RT\crossSession';

%ANIMAL #4
%I42L 1
 path_dir{4} = {'G:\OCGOL_stability_recall\I42L_1\I42L_AB_d1_032118_1',...
     'G:\OCGOL_stability_recall\I42L_1\I42L_AB_d2_032218_2',...
     'G:\OCGOL_stability_recall\I42L_1\I42L_AB_d3_032318_3',...
     'G:\OCGOL_stability_recall\I42L_1\I42L_AB_d6_032618_4',...
     'G:\OCGOL_stability_recall\I42L_1\I42L_AB_d7_032718_5',...
     'G:\OCGOL_stability_recall\I42L_1\I42L_AB_d8_032818_6',...
     'G:\OCGOL_stability_recall\I42L_1\I42L_AB_d9_032918_7'};
%cross session directory
crossdir{4} = 'G:\OCGOL_stability_recall\I42L_1\crossSession';

%ANIMAL #5
%I47 LP
path_dir{5} = {'G:\OCGOL_stability_recall\I47_LP\I47_LP_AB_d1_062018_1',...
     'G:\OCGOL_stability_recall\I47_LP\I47_LP_AB_d2_062118_2',...
     'G:\OCGOL_stability_recall\I47_LP\I47_LP_AB_d3_062218_3',...
     'G:\OCGOL_stability_recall\I47_LP\I47_LP_AB_d6_062518_4',...
     'G:\OCGOL_stability_recall\I47_LP\I47_LP_AB_d7_062618_5',...
     'G:\OCGOL_stability_recall\I47_LP\I47_LP_AB_d8_062718_6',...
     'G:\OCGOL_stability_recall\I47_LP\I47_LP_AB_d9_062818_7'};
%cross session directory
crossdir{5} = 'G:\OCGOL_stability_recall\I47_LP\crossSession';
 

%% Run the analysis for STC export for splitter cell analysis

%this is the number of animals
for ii=[1 2 3 4 5]
    disp(['Running animal: ', num2str(ii)])
    OCGOL_recall_remapping_Jason_export_STC_shortened_V0(path_dir{ii},crossdir{ii})
end

%% Run the export of correct vs incorrect trial analysis (does not include random selection of laps)

%this is the number of animals
% for ii=[1 2 3 4 5]
%     disp(['Running animal: ', num2str(ii)])
%     extract_STCs_for_split_session_analysis(path_dir{ii},crossdir{ii})
% end




