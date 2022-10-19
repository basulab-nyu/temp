%% Directory containing cross session data

data_dir{1} = 'G:\OCGOL_learning_short_term\I56_RTLS\crossSession';
data_dir{2} = 'G:\OCGOL_learning_short_term\I57_RTLS\crossSession';
data_dir{3} = 'G:\OCGOL_learning_short_term\I57_LT\crossSession';
data_dir{4} = 'E:\OCGOL_learning_short_term\I58_RT\crossSession';
data_dir{5} = 'E:\OCGOL_learning_short_term\I58_LT\crossSession';
data_dir{6} = 'E:\OCGOL_learning_short_term\I58_RTLP\crossSession';


%% Load in performance and lap data across learning

for ss=1:size(data_dir,2)
    performance_lap_data{ss} = load(fullfile(data_dir{ss},'perf_lap_tables.mat'));
end


%% Multiply performance data by lap data and find sessions where there are at least 5 error and 5 correct laps

%run for each animal
for ii=1:size(data_dir,2)
    laps_correct{ii} = performance_lap_data{ii}.ses_lap_ct_table{:,:}.* performance_lap_data{ii}.ses_perf_table{:,:};
    laps_incorrect{ii} = performance_lap_data{ii}.ses_lap_ct_table{:,:} - laps_correct{ii};
end

%find A and B trials where there are at least 5 laps
for ii=1:size(data_dir,2)
    min_5_corr_incorr_laps{ii} = (laps_correct{ii} >=5) & (laps_incorrect{ii} >=5);
end

%logicals for A and B laps (animal x session) where there are 5 of each
%type of laps

%preallocate
A_min_laps = zeros(6,9);
B_min_laps = zeros(6,9);

for ii=1:size(data_dir,2)
    %check A laps
    if ~isempty(find(min_5_corr_incorr_laps{ii}(2,:) ==1))
        A_min_laps(ii,find(min_5_corr_incorr_laps{ii}(2,:) ==1)) = 1;
    end

    %check B laps
    if ~isempty(find(min_5_corr_incorr_laps{ii}(3,:) ==1))
        B_min_laps(ii,find(min_5_corr_incorr_laps{ii}(3,:) ==1)) = 1;
    end    
    
end

sum(sum(A_min_laps))

sum(sum(B_min_laps))







