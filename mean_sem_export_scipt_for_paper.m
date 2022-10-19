%% import prism fraction of licks data on A and B trials

dirpath = 'C:\Users\rzeml\Google Drive\task_selective_place_paper\matlab_data\fig1_csv_data_prism_export';

%fraction of licks in reward zone
frac_licks_A = readmatrix(fullfile(dirpath,'A fraction of licks in reward zone.csv'),'Range','B2:E5');
frac_licks_B = readmatrix(fullfile(dirpath,'B fraction of licks in reward zone.csv'),'Range','B2:E5');

%fraction correct trials
frac_corr_A = readmatrix(fullfile(dirpath,'Fraction correct A trials.csv'),'Range','B2:E5');
frac_corr_B = readmatrix(fullfile(dirpath,'Fraction correct B trials.csv'),'Range','B2:E5');

%% import data for figure 2 stats

dirpath = 'C:\Users\rzeml\Google Drive\task_selective_place_paper\matlab_data';

load(fullfile(dirpath,'source_data_fig2.mat'))
load(fullfile(dirpath,'source_data_fig3.mat'))
load(fullfile(dirpath,'source_data_fig4_5_and_sup.mat'))

%% Mean and sem for licking fraction of correct trials across training sessions

nb_animals = size(frac_licks_A,2);
%licking mean and sem
mean_lick.A = mean(frac_licks_A,1);
mean_lick.B = mean(frac_licks_B,1);

sem_lick.A = std(frac_licks_A,0,1)./sqrt(nb_animals);
sem_lick.B = std(frac_licks_B,0,1)./sqrt(nb_animals);

%fraction correct mean and sem
mean_corr.A = mean(frac_corr_A,1);
mean_corr.B = mean(frac_corr_B,1);

sem_corr.A = std(frac_corr_A,0,1)./sqrt(nb_animals);
sem_corr.B = std(frac_corr_B,0,1)./sqrt(nb_animals);

%% Mean and sem data for figure 2

nb_FOV = size(source_data_task_sel_remap.mean_AUC.run.Asel,1);

%run
mean_AUC.run.A = mean(source_data_task_sel_remap.mean_AUC.run.Asel,1);
mean_AUC.run.B = mean(source_data_task_sel_remap.mean_AUC.run.Bsel,1);
mean_AUC.run.AB = mean(source_data_task_sel_remap.mean_AUC.run.AB,1);

sem_AUC.run.A = std(source_data_task_sel_remap.mean_AUC.run.Asel,0,1)./sqrt(nb_FOV);
sem_AUC.run.B = std(source_data_task_sel_remap.mean_AUC.run.Bsel,0,1)./sqrt(nb_FOV);
sem_AUC.run.AB = std(source_data_task_sel_remap.mean_AUC.run.AB,0,1)./sqrt(nb_FOV);

%no run
mean_AUC.norun.A = mean(source_data_task_sel_remap.mean_AUC.norun.Asel,1);
mean_AUC.norun.B = mean(source_data_task_sel_remap.mean_AUC.norun.Bsel,1);
mean_AUC.norun.AB = mean(source_data_task_sel_remap.mean_AUC.norun.AB,1);

sem_AUC.norun.A = std(source_data_task_sel_remap.mean_AUC.norun.Asel,0,1)./sqrt(nb_FOV);
sem_AUC.norun.B = std(source_data_task_sel_remap.mean_AUC.norun.Bsel,0,1)./sqrt(nb_FOV);
sem_AUC.norun.AB = std(source_data_task_sel_remap.mean_AUC.norun.AB,0,1)./sqrt(nb_FOV);

%% Fraction of Tuned neurons by SI and TS criteria

mean_si = mean(source_data_task_sel_remap.frac_tuned.si,1);
sem_si = std(source_data_task_sel_remap.frac_tuned.si,0,1)./sqrt(nb_FOV);

mean_ts = mean(source_data_task_sel_remap.frac_tuned.ts,1);
sem_ts = std(source_data_task_sel_remap.frac_tuned.ts,0,1)./sqrt(nb_FOV);

%% TC correlation difference between A B and AB neurons

mean_TC.A = mean(source_data_task_sel_remap.mean_TC.Asel);
mean_TC.B = mean(source_data_task_sel_remap.mean_TC.Bsel);
mean_TC.AB = mean(source_data_task_sel_remap.mean_TC.AB);

sem_TC.A = std(source_data_task_sel_remap.mean_TC.Asel)./sqrt(nb_FOV);
sem_TC.B = std(source_data_task_sel_remap.mean_TC.Bsel)./sqrt(nb_FOV);
sem_TC.AB = std(source_data_task_sel_remap.mean_TC.AB)./sqrt(nb_FOV);

%% Remapping fractions and zone II A vs. B shift mean and sem

frac_remap_mean = mean(source_data_AB_remap.frac_class_mean);
frac_remap_sem = std(source_data_AB_remap.frac_class_mean)./sqrt(nb_FOV);

zoneII_mean = mean(source_data_AB_remap.global_shift.zoneII_diff);
zoneII_sem = std(source_data_AB_remap.global_shift.zoneII_diff)./sqrt(nb_FOV);

%% Export the data to word

%% Start Word document that will contain the formatted stats data

WordFileName='fig_1_mean_sem.doc';
CurDir=pwd;
FileSpec = fullfile(CurDir,WordFileName);
%active X handle for manipulating document (ActXWord)
[ActXWord,WordHandle]=StartWord(FileSpec);

fprintf('Document will be saved in %s\n',FileSpec);

%% Licking mean and sem in reward zones

%RF A trials
mean_txt = mean_lick.A(1);
sem_txt = sem_lick.A(1);

txt_input = 'RF A trials licking in reward zone';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);
writeWordEnter(ActXWord,WordHandle,1);

%Random AB A trials
mean_txt = mean_lick.A(4);
sem_txt = sem_lick.A(4);

txt_input = 'Random AB A trials licking in reward zone';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);
writeWordEnter(ActXWord,WordHandle,1);

%RF B trials
mean_txt = mean_lick.B(1);
sem_txt = sem_lick.B(1);

txt_input = 'RF B trials licking in reward zone';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);
writeWordEnter(ActXWord,WordHandle,1);

%Random AB B trials
mean_txt = mean_lick.B(4);
sem_txt = sem_lick.B(4);

txt_input = 'Random AB B trials licking in reward zone';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);
writeWordEnter(ActXWord,WordHandle,1);

%% Fraction correct trials mean and sem
writeWordEnter(ActXWord,WordHandle,1);
writeWordEnter(ActXWord,WordHandle,1);

%RF A trials
mean_txt = mean_corr.A(1);
sem_txt = sem_corr.A(1);

txt_input = 'RF A trials fraction of correct trials';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);
writeWordEnter(ActXWord,WordHandle,1);

%Random AB A trials
mean_txt = mean_corr.A(4);
sem_txt = sem_corr.A(4);

txt_input = 'Random AB A trials fraction of correct trials';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);
writeWordEnter(ActXWord,WordHandle,1);

%RF B trials
mean_txt = mean_corr.B(1);
sem_txt = sem_corr.B(1);

txt_input = 'RF B trials fraction of correct trials';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);
writeWordEnter(ActXWord,WordHandle,1);

%Random AB B trials
mean_txt = mean_corr.B(4);
sem_txt = sem_corr.B(4);

txt_input = 'Random AB B trials fraction of correct trials';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);
writeWordEnter(ActXWord,WordHandle,1);

%% AUC for A/B/AB for run and norun epochs
writeWordEnter(ActXWord,WordHandle,1);
writeWordEnter(ActXWord,WordHandle,1);

%A sel RUN
txt_input = 'A sel A vs. B AUC/min RUN';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_AUC.run.A(1);
sem_txt = sem_AUC.run.A(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_AUC.run.A(2);
sem_txt = sem_AUC.run.A(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%B RUN
txt_input = 'B-sel A vs. B AUC/min RUN';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_AUC.run.B(1);
sem_txt = sem_AUC.run.B(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_AUC.run.B(2);
sem_txt = sem_AUC.run.B(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%%%%%

%AB RUN
txt_input = 'AB A vs. B AUC/min RUN';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_AUC.run.AB(1);
sem_txt = sem_AUC.run.AB(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_AUC.run.AB(2);
sem_txt = sem_AUC.run.AB(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%%%%%%%%%%%%% NO RUN %%%%%%%%%%%%%%%

%A sel NORUN
txt_input = 'A sel A vs. B AUC/min NORUN';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_AUC.norun.A(1);
sem_txt = sem_AUC.norun.A(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_AUC.norun.A(2);
sem_txt = sem_AUC.norun.A(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%B NORUN
txt_input = 'B-sel A vs. B AUC/min NORUN';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_AUC.norun.B(1);
sem_txt = sem_AUC.norun.B(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_AUC.norun.B(2);
sem_txt = sem_AUC.norun.B(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%%%%%

%AB NORUN
txt_input = 'AB A vs. B AUC/min NORUN';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_AUC.norun.AB(1);
sem_txt = sem_AUC.norun.AB(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_AUC.norun.AB(2);
sem_txt = sem_AUC.norun.AB(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%% Fraction tuned IS
%SI A vs. B
txt_input = 'A vs B SI';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_si(1);
sem_txt = sem_si(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_si(2);
sem_txt = sem_si(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%SI A vs. AB
txt_input = 'A vs AB SI';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_si(1);
sem_txt = sem_si(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_si(3);
sem_txt = sem_si(3);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);
%SI B vs. AB
txt_input = 'B vs AB SI';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_si(2);
sem_txt = sem_si(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_si(3);
sem_txt = sem_si(3);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%%%%%%%%TS %%%%%%%%%%%
%ts A vs. B
txt_input = 'A vs B ts';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_ts(1);
sem_txt = sem_ts(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_ts(2);
sem_txt = sem_ts(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%ts A vs. AB
txt_input = 'A vs AB ts';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_ts(1);
sem_txt = sem_ts(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_ts(3);
sem_txt = sem_ts(3);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);
%ts B vs. AB
txt_input = 'B vs AB ts';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_ts(2);
sem_txt = sem_ts(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_ts(3);
sem_txt = sem_ts(3);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%% Mean TC score between selective neurons  
%TC A vs. B
txt_input = 'A vs B TC mean';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_TC.A;
sem_txt = sem_TC.A;
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_TC.B;
sem_txt = sem_TC.B;
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

% A vs AB TC mean
txt_input = 'A vs AB TC mean';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_TC.A;
sem_txt = sem_TC.A;
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_TC.AB;
sem_txt = sem_TC.AB;
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

% B vs AB TC mean
txt_input = 'B vs AB TC mean';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = mean_TC.B;
sem_txt = sem_TC.B;
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = mean_TC.AB;
sem_txt = sem_TC.AB;
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);


%% Fraction remapping neurons 
%order of each class of remappers
%'Common'	'Activity'	'Global'	'Partial'	'Unclassified'

% common vs activity 
txt_input = 'Common vs. activity';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = frac_remap_mean(1);
sem_txt = frac_remap_sem(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = frac_remap_mean(2);
sem_txt = frac_remap_sem(2);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

% common vs global
txt_input = 'Common vs. global';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = frac_remap_mean(1);
sem_txt = frac_remap_sem(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = frac_remap_mean(3);
sem_txt = frac_remap_sem(3);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

% common vs global
txt_input = 'Common vs. partial';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = frac_remap_mean(1);
sem_txt = frac_remap_sem(1);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

txt_input = ' vs. ';
writeDefaultWordText(ActXWord,WordHandle,txt_input);

mean_txt = frac_remap_mean(4);
sem_txt = frac_remap_sem(4);
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

% zone II mean sem for global remapping neurons
txt_input = 'Zone II A vs. B for global remap';
writeDefaultWordText(ActXWord,WordHandle,txt_input);
%newline
writeWordEnter(ActXWord,WordHandle,1);

mean_txt = zoneII_mean;
sem_txt = zoneII_sem;
write_mean_sem(ActXWord,WordHandle, mean_txt,sem_txt);

writeWordEnter(ActXWord,WordHandle,1);

%% Close Word document
%CloseWord(ActXWord,WordHandle,FileSpec);

