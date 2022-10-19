%% Load in animal of interest

%lab workstation
%input directories to matching function
%path_dir = {'G:\OCGOL_training\I56_RLTS_041019\5A5B'};
path_dir = {'G:\Figure_2_3_selective_remap\I42L_AB_d1_032118_1'};
%cross session directory
%crossdir = 'G:\OCGOL_training\I56_RLTS_041019\crossSession';

%load place cell variables for each session
%get mat directories in each output folder
for ii=1:size(path_dir,2)
    %get matfile names for each session
    matfiles{ii} = dir([path_dir{ii},'\output','\*.mat']);
end
%load in place cell variables (and others later)
for ii = 1:size(path_dir,2)
    %add event variables
    session_vars{ii} = load(fullfile(matfiles{ii}.folder,matfiles{ii}.name),'Place_cell', 'Behavior',...
        'Behavior_split_lap','Behavior_split','Events_split','Events_split_lap',...
        'Imaging_split', 'Imaging');
end


%% Input data
%input data (time x ROI)
%input_data = traces;

%run sequence neurons from run_sequence_detection_script
%recurring_neuron_idx;

% all A laps (calcium trace - time x ROI)
input_data = session_vars{1}.Imaging_split{1}.trace_restricted;
%all id'd + selected neurons 
input_data_all = input_data;

%select only run sequence neurons in input data
%input_data = input_data(:,recurring_neuron_idx);

%normalized position
position_norm = session_vars{1}.Behavior_split{1}.resampled.position_norm;
%run epoch binary
run_epoch = session_vars{1}.Behavior_split{1}.run_ones;

%input_data = traces(st_idx:end_idx,input_neuron_idxs_sorted);

traces = input_data;

%% 3rd order Savitzky-Golay filter frame size 500ms (~15 frames)

%order of filter
sg_order = 3;
%window of filter
sg_window = 15;
%filter along first dimension (across rows)
filtered_traces = sgolayfilt(input_data,sg_order,sg_window,[],1);

%plot side by side (sample ROI
ROI = 1;
figure;
hold on
plot(input_data(:,ROI), 'k')
plot(filtered_traces(:,ROI)-1,'r');

%% Plot traces as line plot (vs imagesc)
figure;
subplot(1,2,1)
hold on;
%ylim([-0.5 1])
title('Savitzky-Golay filtered calcium traces')
stepSize = 2;
step = 0;
%first 30 ROIs
for ii=1:30size(filtered_traces,2)
    plot(filtered_traces(:,ii)-step, 'k', 'LineWidth', 1.5)
    step = step - stepSize;
end

%ylabel('Normalized Position');
%plot(norm_position(st_idx:end_idx)-step,'r');

subplot(1,2,2)
hold on;
%ylim([-0.5 1])
title('Non-filtered calcium traces')
stepSize = 2;
step = 0;
for ii=1:30%size(filtered_traces,2)
    plot(input_data(:,ii)-step, 'k', 'LineWidth', 1.5)
    step = step - stepSize;
end

%% Detect events based on threshold
%for each cell
%sum of the median value with 3x interquartile range calculated within:
%sliding window -2/+2 s 
%2s = 60 frames
win_width = 60;

%moving median
med_traces = movmedian(filtered_traces,[win_width win_width],1);

%create blank iqr vector for 1 neuron (for all neurons - ROIx time)
iqr_range = zeros(size(filtered_traces,2),size(filtered_traces,1));
%interquartile range (start at first index will be win_width+1 etc
for ii=1:size(filtered_traces,1)-2*win_width %(set range here and add edges detection in the future
    iqr_range(:,win_width+ii) = iqr(filtered_traces(ii:((2*win_width)+ii),:),1);
end

%set threshold for detection later on
event_thres = 3*iqr_range + med_traces';
%set to time x ROI format
event_thres = event_thres';


%%
%try different ROIs:
ROI = 4;

%% Plot trace, median and irq range - works
figure
hold on
stepSize = 2;
step = 0;
for ii =1:30
    ROI=ii;
    %plot all
    %trace
    plot(filtered_traces(:,ROI) - step,'k');
    %sliding median
    plot(med_traces(:,ROI) - step, 'r');
    
    %sliding interquartile range
    %plot(iqr_range, 'g');
    plot((3*iqr_range(ROI,:) + med_traces(:,ROI)') - step, 'b');
    step = step - stepSize;
end

%position
plot(position_norm-step+2,'r');

%% Detect events above 3x IQR interval

%get logical of all points where event exceeds threshold
thres_traces = filtered_traces > event_thres;

figure;
imagesc(thres_traces')

%% Select only events in noRun intervals

%select binary interval for select processing interval
run_binary_interval = run_epoch;

%remove run events
noRun_thres_traces = thres_traces & ~repmat(logical(run_binary_interval),1,size(thres_traces,2));

figure;
subplot(3,1,1)
imagesc(noRun_thres_traces')
subplot(3,1,2)
imagesc(~repmat(logical(run_binary_interval),1,size(thres_traces,2))')
subplot(3,1,3)
hold on
title('No run interval')
ylim([0 2]);
xlim([1 size(thres_traces,1)]);
plot(~run_binary_interval,'r')

%% Create an onset matrix (not filtered by delay separation)

diff_thres = diff(double(noRun_thres_traces),1,1);

%only get onsets
diff_thres = diff_thres == 1; 

%get index of each onset and check if event is within 
%for each ROI
for rr = 1:size(diff_thres,2)
    event_idx{rr} = find(diff_thres(:,rr) == 1);
end

%reconstruct matrix with onsets alone
%create blank 
noRun_event_matrix = zeros(size(diff_thres,1),size(diff_thres,2));
%reconstruct filtered events for each ROI
for rr=1:size(event_idx,2)
    noRun_event_matrix(event_idx{rr},rr) = 1;
end

%add zero to first frame to account for offset
noRun_event_matrix = [zeros(1,size(noRun_event_matrix,2));noRun_event_matrix];

%plot
figure;
imagesc(noRun_event_matrix')


%% Run SCE shuffle - use event matrix above as input
%make option to set # of shuffles
%also return mean, std, and 
[sce_threshold] = sce_detection_shuffle(noRun_event_matrix,run_binary_interval,thres_traces);
%previous thres = 8.33 sync events on frame

%% Incorporate shuffle here based on detected events within run intervals
%take detected events (binary in event space before delay filtering)
%randomly scramble across the entire no run interval 

% %indices where the animal is not running
% noRun_int_idx = find(run_binary_interval == 0);
% %indices where it is running
% run_int_idx = find(run_binary_interval == 1);
% 
% %events only in no run interval that were selected
% noRun_thres_traces;
% 
% %preallocate cells for N shuffles
% shuffle_nb = 100;
% shuffled_cell = cell(1,shuffle_nb);
% 
% %preallocate each cell with 0 matrix to speed up
% for cc=1:shuffle_nb
%     shuffled_cell{cc} = zeros(size(noRun_thres_traces,2),size(noRun_int_idx,1));
% end

% tic; %70 seconds for 100 shuffles
% for cc=1:shuffle_nb
%     %shuffle events in no run inverval - each ROI
%     for rr=1:size(noRun_thres_traces,2)
%         shuffled_cell{cc}(rr,:) = randperm(size(noRun_int_idx,1));
%     end
%     disp(cc);
% end
% toc;
% 
% tic; %23 seconds (>3 fold speed-up compared to above code)
% for cc=1:shuffle_nb
%     [~, shuffled_cell{cc}] = sort(rand(size(noRun_thres_traces,2),size(noRun_int_idx,1)),2);
%     disp(cc);
% end
% toc;
% 
% %reconsitute a shuffled event matrix
% %preallocate using copy of original matrix
% shuffled_events = noRun_thres_traces';
% for rr=1:size(noRun_thres_traces,2)
%     shuffled_events(rr,noRun_int_idx) = noRun_thres_traces(shuffle_idx(rr,:),rr);
% end
% 
% %preallocate cells for shuffle events
% shuffle_nb = 100;
% shuffled_events = cell(1,shuffle_nb);
% 
% %assign the existing matrix to the matrix holders
% for cc=1:shuffle_nb
%     shuffled_events{cc} = noRun_thres_traces';
% end
% 
% %permute the no run epochs based on the shuffle above
% for cc=1:shuffle_nb
%     shuffled_events{cc}(:,noRun_int_idx) = noRun_thres_traces(shuffled_cell{cc});
%     %shuffled_events{cc}(:,noRun_int_idx) = shuffled_events{cc}(shuffled_cell{cc});
% end
% 
% %compare original vs shuffled events matrix in subplot
% figure;
% subplot(2,1,1)
% imagesc(noRun_thres_traces')
% 
% subplot(2,1,2)
% imagesc(shuffled_events{cc})


%% Select individual onsets separated at least 1s - WORKS!

%frames - 1s = 30 frames
min_dur = 30;

%get onsets and offsets
diff_thres = diff(double(noRun_thres_traces),1,1);

%only get onsets
diff_thres = diff_thres == 1; 

%get index of each onset and check if event is within 
%for each ROI
for rr = 1:size(diff_thres,2)
    event_idx{rr} = find(diff_thres(:,rr) == 1);
end

%run diff, if diff < min_dur, remove event
%do this iteratively for each ROI
%set iterative flag
check_events = 1;

for  rr = 1:size(diff_thres,2)
    diff_events{rr} = diff(event_idx{rr});
    
    while check_events == 1
        
        %find first diff less than frame space duration, remove recalulate diff
        temp_dur_flag = find(diff_events{rr} < min_dur,1);
        
        %if dur_flag not empty
        if ~isempty(temp_dur_flag)
            %remove that +1 event
            event_idx{rr}(temp_dur_flag+1) = [];
            %recalulate diff on updated event list
            diff_events{rr} = diff(event_idx{rr});
            %keep flag on
            check_events = 1;
        else
            %reset flag
            check_events = 0;
        end
    end
    %reset flag for next ROI
    check_events = 1;
end

%reconstruct events
%create blank 
dur_filtered_event = zeros(size(diff_thres,1),size(diff_thres,2));
%reconstruct filtered events for each ROI
for rr=1:size(event_idx,2)
    dur_filtered_event(event_idx{rr},rr) = 1;
end

%filter out events with in 1s of one another - lots of code when  more than
%1 events that are clustered events
%sum_dur_mat = movsum(diff_thres, [0 min_dur-1],1);

%% Plot final filter
figure;
subplot(2,1,1)
hold on
xlim([1 size(thres_traces,1)])
stepSize = 2;
step = 0;
for ii=1:30%size(filtered_traces,2)
    plot(noRun_thres_traces(:,ii)-step, 'k', 'LineWidth', 1.5)
    step = step - stepSize;
end
%check onset and duration separation filter
subplot(2,1,2)
hold on
xlim([1 size(thres_traces,1)])
stepSize = 2;
step = 0;
for ii=1:30%size(filtered_traces,2)
    plot(diff_thres(:,ii)-step, 'k', 'LineWidth', 1.5)
    plot(dur_filtered_event(:,ii)-step, 'r', 'LineWidth', 1.5)
    step = step - stepSize;
end

%% Separate plot to check sync events
figure
hold on
xlim([1 size(thres_traces,1)])
stepSize = 2;
step = 0;
for ii=1:100%size(filtered_traces,2) %first 100 ROIs to check
    plot(diff_thres(:,ii)-step, 'k', 'LineWidth', 1.5)
    plot(dur_filtered_event(:,ii)-step, 'r', 'LineWidth', 1.5)
    step = step - stepSize;
end

%% Pad one index with 0 that's lost with derivative processing above

final_events = [zeros(1,size(dur_filtered_event,2));dur_filtered_event];

%% Detect SCE by running moving sum across the filtered traces and 

%minimum cells that must particupate in SCE
min_cell_nb = 5;

%width of sync events - 200ms = 6 frames
%5 will give 2 behind, center and 2 ahead
%6 will gives 3 beind, cetner
sync_window_width = 6;

%collapse all the no run SCE events 
summed_events_SCE = sum(final_events,2);

%count sync events within time window witdh
sce_event_count = movsum(summed_events_SCE,sync_window_width);

%plot
figure;
hold on
ylabel('Synchronous event count')
plot(sce_event_count)
%minimum cell involvement line
plot([1 size(thres_traces,1)],[min_cell_nb min_cell_nb],'r--')
%threshold determined by shuffle
plot([1 size(thres_traces,1)],[sce_threshold sce_threshold],'b--')

%% Find neurons involved in each SCE
%within 200 ms (6 frames)

%get of SCE frame indices; use 5 as a cutoff for now - use shuffle-based
%threshold later
%threshold or min number - whichever is greater
if sce_threshold > 5
    sync_idx = find(sce_event_count >= sce_threshold);
    %number of calcium events associated with each SCE
    sync_event_count = sce_event_count(sync_idx);
else
    sync_idx = find(sce_event_count >= 5);
    sync_event_count = sce_event_count(sync_idx);
end

%combine sync_idx and sync_event_count into 1 matrix
sync_comb = [sync_idx sync_event_count];

%use all the indices for now, reconsider later (i.e. exclude some/all of
%the neighboring intervals (i.e. filter here in the future)
%proposal: for each segment of frame neighboring ROIs, select 1 index which
%has the most ROIs involved in SCE

%for each SCE, identify the neurons involved (based on window width of 6
%frames)
%defined above

%for each index, take frame range (3 idx before until 2 idx after)
%take frame slide of processed activity, sum and include ROI idx
for ss=1:size(sync_idx,1)
    SCE_ROIs{ss} = find(sum(final_events(sync_idx(ss)-3:sync_idx(ss)+2,:),1) > 0);
end

%numbers of ROIs participating in each SCE
size_dim2 = @(x) size(x,2);
SCE_ROI_nb = cell2mat(cellfun(size_dim2,SCE_ROIs,'UniformOutput',false));

%add to combined matrix
sync_comb = [sync_comb, SCE_ROI_nb'];

%% Save relevant variables in folder for future analysis
%SCE_ROIs - ROIs associated with each frame SCE
%sync_idx - indices of SCEs
%sce_threshold - shuffle determined threshold for # of events needed to
%sce_event_count - number of events within 200 ms window on each frame 
%consider SCE statistically signifant
%final_events - event onsets with filtered events according to criteria
%above

%make shared folder for sequence analysis
cd(path_dir{1})
mkdir('sequence_analysis')

save(fullfile(path_dir{1},'sequence_analysis','SCE_detection_output.mat'),'SCE_ROIs','sync_idx',...
    'sce_threshold','sce_event_count','final_events');


%% For each SCE, get fraction of neurons that are tuned by respective criteria

%1 - A tuned
%2 - B tuned
%3 - A&B tuned
%4 - neither

%onlyA_idx = find(tunedLogical.si.onlyA_tuned ==  1);
%after filter
onlyA_idx = task_selective_ROIs.A.idx;
%onlyB_idx = find(tunedLogical.si.onlyB_tuned ==  1);
%after filter
onlyB_idx = task_selective_ROIs.B.idx;
AandB_idx = find(tunedLogical.ts.AandB_tuned == 1);

%centroid diff associated with with A&B tuned neurons
%find(tunedLogical.ts.AandB_tuned ==1)

for ss=1:size(SCE_ROIs,2)
    log_A{ss} = ismember(SCE_ROIs{ss},onlyA_idx);
    %percentrage A of all ROIs in SCE
    percentages(ss,1) = size(find(log_A{ss}==1),2)/size(log_A{ss},2);
    log_B{ss} = ismember(SCE_ROIs{ss},onlyB_idx);
    %percentrage B of all ROIs in SCE
    percentages(ss,2) = size(find(log_B{ss}==1),2)/size(log_B{ss},2);
    [log_AB{ss},cent_idx{ss}] = ismember(SCE_ROIs{ss},AandB_idx);
    %get mean centroid diff for involved neurons
    mean_cent_diff(ss) = rad2deg(nanmean(cent_diff_AandB.angle_diff(cent_idx{ss}(log_AB{ss}))));
    %percentrage A&B of all ROIs in SCE
    percentages(ss,3) = size(find(log_AB{ss}==1),2)/size(log_AB{ss},2);
end

%add centroid diff to percentrages
percentages = [percentages, mean_cent_diff'];

%% Extract sync intervals, neurons involved, and plot

%plot entire dF/F for each sync event ROIs
figure
imagesc(traces(:,SCE_ROIs{77}  )')
hold on
axis normal;
caxis([0 1]);
ylabel('Neuron #');
colormap(gca,'jet')
hold off

input_data_A = session_vars{1}.Imaging_split{1}.trace_restricted;
input_data_B = session_vars{1}.Imaging_split{2}.trace_restricted;

%dF/F
figure
subplot(1,2,1)
imagesc(input_data_A(:,SCE_ROIs{78})')
hold on
title('A')
axis normal;
caxis([0 1]);
ylabel('Neuron #');
colormap(gca,'jet')
hold off

subplot(1,2,2)
imagesc(input_data_B(:,SCE_ROIs{78})')
hold on
title('B')
axis normal;
caxis([0 1]);
ylabel('Neuron #');
colormap(gca,'jet')
hold off

%% Same code as in early simple version search

%A correct
time_choice = session_vars{1}.Behavior_split{1}.resampled.time;
time = session_vars{1, 1}.Behavior.resampled.time;

[~,select_speed_idx,~] = intersect(time,time_choice,'stable');

speed = session_vars{1, 1}.Behavior.speed;

%overwrite
speed = speed(select_speed_idx);

run_onsets = session_vars{1}.Events_split{1}.Run;
norun_onsets = session_vars{1}.Events_split{1}.NoRun;

%binary onset logicals - using Dombeck search
%run_binary = run_onsets.run_onset_binary;
%norun_binary = norun_onsets.norun_onset_binary;
norun_binary = final_events;

%combine binary onsets:
combined_binary = norun_binary;

% onset_ROIs_log (override with all tuned ROI to both or either trial)
%onset_ROIs_log = tunedLogical.si.AorB_tuned;
%all neurons
onset_ROIs_log = logical(ones(1,size(input_data_all,2)));

%input neurons from RUN sequence analysis
%onset_ROIs_log = false(1,size(AorB_tuned,2));
%onset_ROIs_log(thres_neuron_idx) = 1; 

%start and end points of sorted (10-15 frame range) - 500 ms = 15
sync_idx_for_range_sort = 78;

st_evt_sort = sync_idx(sync_idx_for_range_sort)-3;
% st_evt_sort = 11511;
 end_evt_sort = sync_idx(sync_idx_for_range_sort)+2;

plot_range = [1500, 1500];

%start idx (absolute)
st_idx =st_evt_sort-plot_range(1);
%end idx (absolute)
end_idx = st_evt_sort+plot_range(2);

%input_dFF_matrix = traces(2360+700:2900+700,onset_ROIs_log)';

%get absolute idx's of neurons
input_neuron_idxs = find(onset_ROIs_log ==1);

%1500-2000 +700
input_events_matrix = combined_binary(st_evt_sort:end_evt_sort,onset_ROIs_log)';

%sort by event onset
%for each ROI
for rr=1:size(input_events_matrix,1)
    if  ~isempty(find(input_events_matrix(rr,:) > 0,1))
        loc_ROI(rr) = find(input_events_matrix(rr,:) > 0,1);
    else
        loc_ROI(rr) = 0;
    end
end

%sort by index
[M_sort,I] =sort(loc_ROI,'ascend');

%remove neurons that do not have an event in region of interest
I(M_sort == 0) = [];

%neuron idx (global) sorted
input_neuron_idxs_sorted = input_neuron_idxs(I);

figure;
imagesc(input_events_matrix(I,:))
hold on

% Plot speed, position and dF/F trace of neurons prior to SCE in no-run epoch

figure
subplot(4,1,1)
hold on;
xlim([1,end_idx-st_idx])
%speed
plot(speed(st_idx:end_idx),'k');
%plot(time(st_idx:end_idx),speed(st_idx:end_idx),'k');
ylabel('Speed [cm/s]');
xlabel('Time [s]');

subplot(4,1,2)
%position (norm)
hold on
xlim([1,end_idx-st_idx])
%xlim([st_idx,end_idx])
ylabel('Normalized Position');
plot(position_norm(st_idx:end_idx),'k');
%plot(time(st_idx:end_idx),norm_position(st_idx:end_idx),'k');
hold off

%dF/F
subplot(4,1,[3 4])
imagesc(input_data(st_idx:end_idx,input_neuron_idxs_sorted)')
hold on
axis normal;
caxis([0 1]);
ylabel('Neuron #');
colormap(gca,'jet')
hold off

%% Plot traces as line plot (vs imagesc)
figure;
hold on;
stepSize = 2;
step = 0;
for ii=1:size(input_neuron_idxs_sorted,2)
    plot(input_data(st_idx:end_idx,input_neuron_idxs_sorted(ii))-step, 'k', 'LineWidth', 1.5)
    step = step - stepSize;
end

ylabel('Normalized Position');
plot(norm_position(st_idx:end_idx)-step,'r');

%% Temporal shuffle
%SCE corresponded to sync calcium events that involved more cells than
%expected by chance within a 200ms time window (i.e. > 3 std after temporal
%reshuffling of cell activity)...
%and with a minimum 5 cells participation thresgold (this is already)

%shuffle event onsets of all cells with the no run epochs (for each cell)

%recalculate the SCE count - store - do 1000x times - get distribution and
%find where threshold is at p=0.05;





