%% Import all table formatted entries here for data generated for each figure

%import data for each figure
laptop_access = 1;

%laptop path directory
laptop_path_dir = 'C:\Users\rzeml\Google Drive\task_selective_place_paper\matlab_data';
%desktop path directory
desktop_path_dir = 'G:\Google_drive\task_selective_place_paper\matlab_data';

%load table data
if laptop_access == 1
cd(laptop_path_dir)
else
    cd(desktop_path_dir)
end

%load in figure 4 and 5 data
ex_fig_data = load('ex_fig_table_data.mat');

%get number of animals for each group (manual entry for now for Kruskall-Wallis input)
nb_animal_stl = 6;
nb_animal_str = 5;
nb_animal_ltr = 3;

%% Start Word document that will contain the formatted stats data

WordFileName='legend_stats_formatted_extended_fig.doc';
CurDir=pwd;
FileSpec = fullfile(CurDir,WordFileName);
%active X handle for manipulating document (ActXWord)
[ActXWord,WordHandle]=StartWord(FileSpec);

fprintf('Document will be saved in %s\n',FileSpec);


%% Ex Fig. 4b A-B place field speed difference for and A and B selective neurons
%description of statistics
txt_input = 'Ex. Fig. 4b - A-B in-field speed difference for A and B selective neurons';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig4.t_paired_wilcox_Asel(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_paired_wilcox_Asel(1,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_paired_wilcox_Asel(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_paired_wilcox_Asel(1,5));

%description of comparison
comp_descrip = 'A-B place field speed difference in A-selective neurons';
writeOneSampleWilcoxPooled_0(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig4.t_paired_wilcox_Bsel(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_paired_wilcox_Bsel(1,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_paired_wilcox_Bsel(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_paired_wilcox_Bsel(1,5));

%description of comparison
comp_descrip = 'A-B place field speed difference in B-selective neurons';
writeOneSampleWilcoxPooled_0(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%close parenthesis
txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Ex Fig 4c Normalized place field count for task-selective and non-selective neurons

%description of statistics
txt_input = 'Ex. Fig. 4c - Normalized place field count comparisons for task-selective and non-selective neurons';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(1,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(1,5));

%description of comparison
comp_descrip = 'A- vs. B-selective single place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(2,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(2,5));

%description of comparison
comp_descrip = 'A-selective vs. A&B-A single place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(3,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(3,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(3,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_singlePF(3,5));

%description of comparison
comp_descrip = 'A-selective vs. A&B-B single place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%%%% double

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(1,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(1,5));

%description of comparison
comp_descrip = 'A- vs. B-selective double place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(2,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(2,5));

%description of comparison
comp_descrip = 'A-selective vs. A&B-A double place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(3,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(3,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(3,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_doublePF(3,5));

%description of comparison
comp_descrip = 'A-selective vs. A&B-B double place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%%%% triple

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(1,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(1,5));

%description of comparison
comp_descrip = 'A- vs. B-selective triple place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(2,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(2,5));

%description of comparison
comp_descrip = 'A-selective vs. A&B-A triple place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%paired Wilcoxon test with Holm-Sidak correction
dof = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(3,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(3,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(3,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_out.wilcox_triplePF(3,5));

%description of comparison
comp_descrip = 'A-selective vs. A&B-B triple place field count';
writePairedWilcoxAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%close parenthesis
txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Ex Fig 4d - Place field width differences between task-sel and non-sel neurons

%description of statistics
txt_input = 'Ex. Fig. 4c - Normalized place field count comparisons for task-selective and non-selective neurons';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

% KS2 test with p-val correction input
dof = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(1,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(1,5));

%description of comparison
comp_descrip = 'A- vs. B- selective place field width';
%2KS test with Holm-Sidak correction
write2ksTest_p_cor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

% KS2 test with p-val correction input
dof = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(2,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(2,5));

%description of comparison
comp_descrip = 'A- vs. A&B-A- selective place field width';
%2KS test with Holm-Sidak correction
write2ksTest_p_cor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

% KS2 test with p-val correction input
dof = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(3,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(3,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(3,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(3,5));

%description of comparison
comp_descrip = 'A- vs. A&B-B selective place field width';
%2KS test with Holm-Sidak correction
write2ksTest_p_cor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

% KS2 test with p-val correction input
dof = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(4,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(4,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(4,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(4,5));

%description of comparison
comp_descrip = 'B- vs. A&B-A selective place field width';
%2KS test with Holm-Sidak correction
write2ksTest_p_cor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

% KS2 test with p-val correction input
dof = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(5,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(5,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(5,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(5,5));

%description of comparison
comp_descrip = 'B- vs. A&B-B selective place field width';
%2KS test with Holm-Sidak correction
write2ksTest_p_cor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

% KS2 test with p-val correction input
dof = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(6,7));
test_stat = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(6,8));
p_val = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(6,10));
sample_n = table2array(ex_fig_data.table_list.exFig4.t_ks2_pf_width(6,5));

%description of comparison
comp_descrip = 'A&B-A vs. A&B-B selective place field width';
%2KS test with Holm-Sidak correction
write2ksTest_p_cor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%close parenthesis
txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Ex Fig 7a - Common vs globap remapping activity index score

%description of statistics
txt_input = 'Ex. Fig. 7a - Common vs global remapping activity index score';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

% KS2 test with p-val correction input
dof = table2array(ex_fig_data.table_list.exFig7.t_kstest_com_vs_act(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig7.t_kstest_com_vs_act(1,8));
p_val = table2array(ex_fig_data.table_list.exFig7.t_kstest_com_vs_act(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig7.t_kstest_com_vs_act(1,5));

%description of comparison
comp_descrip = 'Common vs global remapping activity index score';
%2KS test with Holm-Sidak correction
write2ksTest(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%close parenthesis
txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Ex Fig 7c - Activity rate in run epochs for A vs B laps in activity remapping neurons

%description of statistics
txt_input = 'Ex. Fig. 7c - Activity rate in A vs. B laps during RUN for all activity remapping neurons';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input for paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig7.t_paired_wilcox_activity_rate_com_activity(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig7.t_paired_wilcox_activity_rate_com_activity(1,8));
p_val = table2array(ex_fig_data.table_list.exFig7.t_paired_wilcox_activity_rate_com_activity(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig7.t_paired_wilcox_activity_rate_com_activity(1,5));

%description of comparison
comp_descrip = 'Activity rate in A vs. B laps during RUN for all activity remapping neurons';
writePairedWilcoxPooled_non_cor_pval(ActXWord,WordHandle,comp_descrip,test_stat,p_val, p_val, dof, sample_n);

%close parenthesis
txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Figure 9a - Fraction of A and B-selective place cells during learning
%description of statistics
txt_input = 'Fig 9a - Fraction of A and B-selective place cells during learning';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.learnA(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.learnA(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.learnA(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.learnA(1,5));

comp_descrip = 'Fraction of A-trial tuned place cells during learning - S.I.';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnA_6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnA_6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnA_6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnA_6_7(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 6 A trial learning';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnA_6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnA_6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnA_6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnA_6_7(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 7 A trial learning';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.learnB(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.learnB(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.learnB(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.learnB(1,5));

comp_descrip = 'Fraction of B-trial tuned place cells during learning - S.I.';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnB_6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnB_6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnB_6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnB_6_7(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 6 B trial learning';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnB_6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnB_6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnB_6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.learnB_6_7(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 7 B trial learning';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n);


%% Figure 9a - Fraction of A and B-selective place cells during recall
%description of statistics
% txt_input = 'Fig 4e - Fraction of A and B-selective place cells during recall';
% writeDefaultWordText(ActXWord,WordHandle,txt_input);
% writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.recallA(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.recallA(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.recallA(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.recallA(1,5));

comp_descrip = 'Fraction of A-trial tuned place cells during recall - S.I.';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallA_6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallA_6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallA_6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallA_6_7(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 6 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallA_6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallA_6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallA_6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallA_6_7(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 7 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.recallB(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.recallB(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.recallB(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.recallB(1,5));

comp_descrip = 'Fraction of B-trial tuned place cells during recall - S.I.';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallB_6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallB_6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallB_6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallB_6_7(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 6 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallB_6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallB_6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallB_6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.recallB_6_7(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 7 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%close parenthesis
txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Fig 9b Tuning curve correction - SI - equivalent analysis - learning then recall

%description of statistics
txt_input = 'Fig 9b - TC correlation (SI) relative to day 1 on A and B trials during learning';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%2-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_learn_recallA(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_learn_recallA(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_learn_recallA(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_learn_recallA(1,5));

comp_descrip = 'TC correlation on A trials';

%2-way RM linear mixed effects analysis
write_2wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%separate with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%Learn A 2 vs 6 and 2 vs 7

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnA2v6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnA2v6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnA2v6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnA2v6_7(1,5));

%description of comparison
comp_descrip = 'Day 2 vs. Day 6 A trial learning';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnA2v6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnA2v6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnA2v6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnA2v6_7(2,5));

%description of comparison
comp_descrip = 'Day 2 vs. Day 7 A trial learning';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%separate with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%%%%

%B trials
%2-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_learn_recallB(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_learn_recallB(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_learn_recallB(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_learn_recallB(1,5));

comp_descrip = 'TC correlation on B trials';

%2-way RM linear mixed effects analysis
write_2wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%separate with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%Learn A 2 vs 6 and 2 vs 7

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnB2v6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnB2v6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnB2v6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnB2v6_7(1,5));

%description of comparison
comp_descrip = 'Day 2 vs. Day 6 B trial learning';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnB2v6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnB2v6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnB2v6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learnB2v6_7(2,5));

%description of comparison
comp_descrip = 'Day 2 vs. Day 7 B trial learning';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%%%%%%
%rest of t-test stats comparing recall days and Learning vs Recall

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallA2v6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallA2v6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallA2v6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallA2v6_7(1,5));

%description of comparison
comp_descrip = 'Day 2 vs. Day 6 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallA2v6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallA2v6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallA2v6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallA2v6_7(2,5));

%description of comparison
comp_descrip = 'Day 2 vs. Day 7 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

% B trials
%paired t-tests
%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallB2v6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallB2v6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallB2v6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallB2v6_7(1,5));

%description of comparison
comp_descrip = 'Day 2 vs. Day 6 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallB2v6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallB2v6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallB2v6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_recallB2v6_7(2,5));

%description of comparison
comp_descrip = 'Day 2 vs. Day 7 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into unpaired
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallA_6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallA_6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallA_6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallA_6_7(1,5));

%description of comparison
comp_descrip = 'Day 6 A trials learning vs. recall';
writeUnPairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into unpaired
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallA_6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallA_6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallA_6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallA_6_7(2,5));

%description of comparison
comp_descrip = 'Day 7 A trials learning vs. recall';
writeUnPairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into unpaired
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallB_6_7(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallB_6_7(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallB_6_7(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallB_6_7(1,5));

%description of comparison
comp_descrip = 'Day 6 B trials learning vs. recall';
writeUnPairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into unpaired
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallB_6_7(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallB_6_7(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallB_6_7(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_learn_recallB_6_7(2,5));

%description of comparison
comp_descrip = 'Day 7 B trials learning vs. recall';
writeUnPairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%close parenthesis
txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Ex Fig 9c - Neighboring day TC SI correlation for A and B trials

%description of statistics
txt_input = 'Fig 9c - Neighboring TC (SI) correlation for A and B trials learning and recall';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%2-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_n_learn_recallA(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_n_learn_recallA(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_n_learn_recallA(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_n_learn_recallA(1,5));

comp_descrip = 'Neighboring session TC correlation on A trials';

%2-way RM linear mixed effects analysis
write_2wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%separate with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%2-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_n_learn_recallB(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_n_learn_recallB(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_n_learn_recallB(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.TC_si_n_learn_recallB(1,5));

comp_descrip = 'Neighboring session TC correlation on B trials';

%2-way RM linear mixed effects analysis
write_2wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%separate with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%Learning 2 paired t-tests(no Holm-Sidak correction for these)
%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_learnA12v67(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_learnA12v67(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_learnA12v67(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_learnA12v67(1,5));

%description of comparison
comp_descrip = 'Days 1 vs. 2 Vs. Day 6 vs. 7 A trials learn';
writePairedTtestAnimal_no_pcor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_learnB12v67(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_learnB12v67(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_learnB12v67(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_learnB12v67(1,5));

%description of comparison
comp_descrip = 'Days 1 vs. 2 Vs. Day 6 vs. 7 B trials learn';
writePairedTtestAnimal_no_pcor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%Recall 2 paired t-tests

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_recallA12v67(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_recallA12v67(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_recallA12v67(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_recallA12v67(1,5));

%description of comparison
comp_descrip = 'Days 1 vs. 2 Vs. Day 6 vs. 7 A trials recall';
writePairedTtestAnimal_no_pcor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_recallB12v67(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_recallB12v67(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_recallB12v67(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.TC_si_n_recallB12v67(1,5));

%description of comparison
comp_descrip = 'Days 1 vs. 2 Vs. Day 6 vs. 7 B trials recall';
writePairedTtestAnimal_no_pcor(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Fig 9d  Mean centroid difference (SI) relative to d1 - A and B trials

%description of statistics
txt_input = 'Fig 9d - Mean centroid difference (SI) relative to day 1 on A and B trials during learning and recall';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%2-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.cent_si_learn_recallA(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.cent_si_learn_recallA(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.cent_si_learn_recallA(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.cent_si_learn_recallA(1,5));

comp_descrip = 'Mean centroid difference relative to Day 1 A trials';

%2-way RM linear mixed effects analysis
write_2wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%2-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.cent_si_learn_recallB(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.cent_si_learn_recallB(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.cent_si_learn_recallB(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_2way_rm_lme.cent_si_learn_recallB(1,5));

comp_descrip = 'Mean centroid difference relative to Day 1 B trials';

%2-way RM linear mixed effects analysis
write_2wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into unpaired
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.cent_si_learn_recallA_15_16(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.cent_si_learn_recallA_15_16(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.cent_si_learn_recallA_15_16(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.cent_si_learn_recallA_15_16(1,5));

%description of comparison
comp_descrip = 'Day 5 A trials learning vs. recall';
writeUnPairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into unpaired
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.cent_si_learn_recallB_15_16(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.cent_si_learn_recallB_15_16(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.cent_si_learn_recallB_15_16(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.cent_si_learn_recallB_15_16(1,5));

%description of comparison
comp_descrip = 'Day 5 B trials learning vs. recall';
writeUnPairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Fig. 9e - A&B tuned A vs B lap spatial tuning correlation relative to D1 during learning

txt_input = 'Fig 9e - Matching A&B tuned neurons A vs B lap correlation normalized to D1 during learning and recall';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%Friedman test input data
dof = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_learn(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_learn(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_learn(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_learn(1,5));

%description of comparison
comp_descrip = 'Day one normalized A vs. B lap correlation scores for matching neurons during learning';
%kruskal wallis test write
writeKruskalWallisTest(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n, nb_animal_stl)

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-sample Wilcox test no multi comp p_val correction against 1
%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_learn(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_learn(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_learn(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_learn(1,5));

%description of comparison
comp_descrip = 'Day 2 learn';
writeOneSampleWilcoxAnimal_1(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-sample Wilcox test no multi comp p_val correction against 1
%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_learn(6,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_learn(6,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_learn(6,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_learn(6,5));

%description of comparison
comp_descrip = 'Day 7 learn';
writeOneSampleWilcoxAnimal_1(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%% Fig. 9e - A&B tuned A vs B lap spatial tuning correlation relative to D1 - recall

% txt_input = 'Fig 5d - Matching A&B tuned neurons A vs B lap correlation normalized to D1 during recall';
% writeDefaultWordText(ActXWord,WordHandle,txt_input);
% writeWordEnter(ActXWord,WordHandle,1);

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%Kruskal-Wallis test input data
dof = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall(1,5));

%description of comparison
comp_descrip = 'Day one normalized A vs. B lap correlation scores for matching neurons during recall';
%kruskal wallis test write
writeKruskalWallisTest(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n,nb_animal_str)

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-sample Wilcox test no multi comp p_val correction against 1
%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_recall(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_recall(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_recall(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_recall(1,5));

%description of comparison
comp_descrip = 'Day 2 recall';
writeOneSampleWilcoxAnimal_1(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-sample Wilcox test no multi comp p_val correction against 1
%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_recall(6,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_recall(6,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_recall(6,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.paired_wilcox_AB_recall(6,5));

%description of comparison
comp_descrip = 'Day 7 recall';
writeOneSampleWilcoxAnimal_1(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Ex Fig 10a - Fraction of A and B-selective place cells during recall - SI
%description of statistics
txt_input = 'Ex. Fig 10a - Fraction of A and B-selective place cells during long-term recall - SI and TS';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_si_A(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_si_A(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_si_A(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_si_A(1,5));

comp_descrip = 'Fraction of A-trial tuned place cells during long-term recall - S.I.';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_A_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_A_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_A_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_A_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_A_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_A_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_A_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_A_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_si_B(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_si_B(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_si_B(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_si_B(1,5));

comp_descrip = 'Fraction of B-trial tuned place cells during long-term recall - S.I.';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_B_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_B_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_B_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_B_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_B_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_B_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_B_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_si_B_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%% Ex Fig 10a - Fraction of A and B-selective place cells during recall - TS - continued

txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_ts_A(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_ts_A(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_ts_A(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_ts_A(1,5));

comp_descrip = 'Fraction of A-trial tuned place cells during long-term recall - T.S.';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_A_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_A_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_A_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_A_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_A_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_A_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_A_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_A_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_ts_B(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_ts_B(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_ts_B(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_ts_B(1,5));

comp_descrip = 'Fraction of B-trial tuned place cells during long-term recall - T.S.';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_B_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_B_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_B_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_B_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_B_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_B_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_B_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_ts_B_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Ex Fig 10c PV correlation long term

%description of stats
txt_input = 'Ex. Fig 10c - PV, TC (SI), TC (TS) during long-term recall relative to d1';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PV_A(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PV_A(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PV_A(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PV_A(1,5));

comp_descrip = 'PV correlation during long-term recall relative to day 1 on A trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_A_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_A_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_A_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_A_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_A_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_A_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_A_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_A_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PV_B(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PV_B(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PV_B(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PV_B(1,5));

comp_descrip = 'PV correlation during long-term recall relative to day 1 on B trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_B_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_B_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_B_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_B_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_B_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_B_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_B_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PV_B_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)


%% Ex Fig 10c TC correlation SI long term - continued

%open parenthesis
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_si_A(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_si_A(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_si_A(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_si_A(1,5));

comp_descrip = 'TC correlation (S.I.) during long-term recall relative to day 1 on A trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_A_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_A_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_A_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_A_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_A_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_A_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_A_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_A_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_si_B(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_si_B(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_si_B(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_si_B(1,5));

comp_descrip = 'TC (S.I.) correlation during long-term recall relative to day 1 on B trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_B_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_B_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_B_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_B_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_B_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_B_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_B_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_si_B_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)



%% Ex Fig 10c TC correlation TS long term - continued

%open parenthesis
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_ts_A(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_ts_A(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_ts_A(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_ts_A(1,5));

comp_descrip = 'TC correlation (T.S.) during long-term recall relative to day 1 on A trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_A_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_A_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_A_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_A_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_A_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_A_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_A_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_A_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_ts_B(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_ts_B(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_ts_B(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TC_ts_B(1,5));

comp_descrip = 'TC (T.S.) correlation during long-term recall relative to day 1 on B trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_B_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_B_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_B_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_B_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 25 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_B_25_30(2,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_B_25_30(2,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_B_25_30(2,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TC_ts_B_25_30(2,5));

%description of comparison
comp_descrip = 'Day 1 vs. Day 30 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);

%% Ex Fig 10d PV correlation neightbor sessions long term

%description of stats
txt_input = 'Ex. Fig 10d - PV, TC (SI), TC (TS) neighboring sessions during long-term recall relative to d1';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);

%open parenthesis
txt_input = '(';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PVn_A(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PVn_A(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PVn_A(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PVn_A(1,5));

comp_descrip = 'Neighboring session PV correlation during long-term recall A trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PVn_A_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PVn_A_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PVn_A_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PVn_A_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. 6 Vs. Day 20 vs. Day 25 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PVn_B(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PVn_B(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PVn_B(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_PVn_B(1,5));

comp_descrip = 'Neighboring session PV correlation during long-term recall B trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PVn_B_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PVn_B_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PVn_B_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_PVn_B_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. 6 Vs. Day 20 vs. Day 25 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%% Ex Fig 10d TC correlation neighboring sessions SI long term - continued

%open parenthesis
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_si_A(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_si_A(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_si_A(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_si_A(1,5));

comp_descrip = 'Neighboring session TC (S.I.) correlation during long-term recall A trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_si_A_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_si_A_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_si_A_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_si_A_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. 6 Vs. Day 20 vs. Day 25 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_si_B(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_si_B(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_si_B(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_si_B(1,5));

comp_descrip = 'Neighboring session TC (S.I.) correlation during long-term recall B trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_si_B_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_si_B_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_si_B_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_si_B_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. 6 Vs. Day 20 vs. Day 25 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%% Ex Fig 10d TC correlation neighboring sessions TS long term - continued

%open parenthesis
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_ts_A(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_ts_A(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_ts_A(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_ts_A(1,5));

comp_descrip = 'Neighboring session TC (T.S.) correlation during long-term recall A trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_ts_A_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_ts_A_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_ts_A_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_ts_A_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. 6 Vs. Day 20 vs. Day 25 A trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);


%B trial group test
%1-way LME input data - extract DOFs from test stats field
dof = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_ts_B(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_ts_B(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_ts_B(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_1_rm_lme.long_TCn_ts_B(1,5));

comp_descrip = 'Neighboring session TC (T.S.) correlation during long-term recall B trials';

%1-way RM linear mixed effects analysis
write_1wayLME(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%split entry with semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%input into paired t-test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_ts_B_25_30(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_ts_B_25_30(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_ts_B_25_30(1,10));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_ttest.long_TCn_ts_B_25_30(1,5));

%description of comparison
comp_descrip = 'Day 1 vs. 6 Vs. Day 20 vs. Day 25 B trial recall';
writePairedTtestAnimal(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);


%% Fig. 10e - A&B tuned A vs B lap spatial tuning correlation relative to D1 - recall

txt_input = 'Fig 10e - Matching A&B tuned neurons A vs B lap correlation normalized to D1 during recall SI and TS';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,1);


%Kruskal-Wallis test input data
dof = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall_lt_si(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall_lt_si(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall_lt_si(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall_lt_si(1,5));

%description of comparison
comp_descrip = 'Day one normalized A vs. B lap correlation (S.I.) scores for matching neurons';
%kruskal wallis test write
writeKruskalWallisTest(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n,nb_animal_ltr)

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-sample Wilcox test no multi comp p_val correction against 1
%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_si(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_si(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_si(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_si(1,5));

%description of comparison
comp_descrip = 'Day 6 recall';
writeOneSampleWilcoxAnimal_1(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-sample Wilcox test no multi comp p_val correction against 1
%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_si(4,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_si(4,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_si(4,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_si(4,5));

%description of comparison
comp_descrip = 'Day 25 recall';
writeOneSampleWilcoxAnimal_1(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)


%% Ex Fig 10e A&B TC corr TS long term - continued

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%Kruskal-Wallis test input data
dof = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall_lt_ts(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall_lt_ts(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall_lt_ts(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_krusall_recall_lt_ts(1,5));

%description of comparison
comp_descrip = 'Day one normalized A vs. B lap correlation (T.S) scores for matching neurons';
%kruskal wallis test write
writeKruskalWallisTest(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n,nb_animal_ltr)

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-sample Wilcox test no multi comp p_val correction against 1
%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_ts(1,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_ts(1,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_ts(1,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_ts(1,5));

%description of comparison
comp_descrip = 'Day 6 recall';
writeOneSampleWilcoxAnimal_1(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

%semicolon
txt_input = '; ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

%1-sample Wilcox test no multi comp p_val correction against 1
%input to 1-sample paired Wilcoxon test
dof = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_ts(4,7));
test_stat = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_ts(4,8));
p_val = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_ts(4,9));
sample_n = table2array(ex_fig_data.table_list.exFig9_10.t_paired_wilcox_AB_recall_lt_ts(4,5));

%description of comparison
comp_descrip = 'Day 25 recall';
writeOneSampleWilcoxAnimal_1(ActXWord,WordHandle,comp_descrip,test_stat,p_val, dof, sample_n)

txt_input = ')';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
writeWordEnter(ActXWord,WordHandle,2);


%% Close Word document
CloseWord(ActXWord,WordHandle,FileSpec);


%order of entry
%test name, test statistic, p value (include rounding and sigstar add),
%test statistic - 2 decimal places
%p-value 3 decimal places and sub to <0.001 for low p values
%nb of samples as a char entry

%% Original function customized
%WriteToWordFromMatlab_testing
