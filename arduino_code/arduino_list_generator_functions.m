%% fixed position generator section
laps = 50;

every = 40;

x = 5:every:185;

x_rep = repmat(x,1,laps);

dlmwrite('every40.txt',x_rep)


%% convert exisiting A and B trials list to A rev and B rev lists
% A = 2, B = 3, Ar = 4, Br = 5

%alternating A B list
alt_AB = [1, 2,3,2,3,2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2,3,2,3,2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2,3,2,3,2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2,3,2,3,2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2,3,2,3,2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2,3,2,3,2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2,3,2,3,2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2,3,2,3,2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3];

% 5A5B block list starting with 10 alternating A and B trials
list_5A5B_alt_start = [1, 2,3,2,3,2, 3, 2, 3, 2, 3, 2,2,2,2,2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3];


% 5A5B block, padded with 'punish trial' at the beginning; (80) + 1 (no
% alternation start)
list_5A5B_1 = [1, 2,2,2,2,2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3];
list_5A5B_2 = [1, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3,2,2,2,2,2];

%3A3B block padded with 'punish start' at the beginning (84) + 1
list_3A3B = [1,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3,2,2,2,3,3,3];

% rand AB 1
randAB_1 = [1, 3, 2, 3, 3, 2, 2, 2, 3, 2, 2, 3, 3, 2, 3, 3, 2, 2, 2, 3, 2, 2, 2, 3, 2, 3, 2, 3, 2, 2, 3, 2, 3, 2, 3, 3, 3, 2, 2, 2, 3, 3, 3, 2, 3, 3, 3, 2, 3, 2, 3, 2, 2, 2, 3, 3, 2, 3, 3, 3, 2, 2, 3, 3, 2, 3, 3, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 2, 2, 3, 2, 3, 2, 3, 2, 3, 3, 2, 3, 3, 2, 2, 2, 3, 2, 2, 3, 2, 3, 2, 3, 2, 2, 3, 2, 3, 2, 2, 3, 3, 2, 3, 2, 2, 2, 3, 3, 2, 3, 3, 3, 2, 2, 2, 3, 2];

% rand AB 2
randAB_2 = [1,3,2,2,3,2,3,2,3,2,3,3,3,2,3,3,2,3,2,2,3,2,3,2,3,3,2,3,3,2,2,3,2,3,3,2,3,2,2,2,3,2,3,3,2,3,3,2,3,2,3,2,3,2,2,3,3,2,2,2,3,2,3,2,2,2,3,2,2,3,2,3,3,2,2,2,3,2,3,2,3,3,2,2,3,2,2,3,2,2,3,2,3,2,3,3,2,3,2,3,2,3,2,2,3,3,2,3,2,2,3,2,3,3,2,3,3,2,3,3,2,3,2,3,3,2];

% rand AB 3
randAB_3 = [1,2,3,3,2,3,3,2,3,2,2,3,3,2,3,3,2,3,2,2,3,2,3,3,2,2,2,3,3,3,2,2,2,3,2,3,3,2,2,3,3,2,3,2,3,2,3,2,2,3,2,3,2,2,3,2,3,2,2,2,3,3,3,2,3,2,3,2,2,3,2,3,2,3,3,2,2,2,3,2,3,2,3,2,3,3,2,3,3,2,3,2,2,2,3,2,2,3,2,3,3,3,2,3,2,2,2,3,2,3,3,2,3,3,3,2,3,2,2,2,3,2,3,3,3,2];

% rand AB 4
randAB_4 = [1,2,3,2,3,2,3,2,3,2,2,3,2,2,2,3,2,3,2,2,3,3,3,2,3,2,3,3,2,3,2,2,3,3,2,3,2,3,2,2,3,2,2,3,2,2,3,2,3,3,3,2,3,3,3,2,3,2,2,3,2,2,3,2,2,3,3,2,3,2,3,3,3,2,3,3,2,3,3,2,3,2,3,2,2,3,2,3,3,2,3,3,2,2,3,2,3,3,3,2,2,3,2,2,2,3,3,2,3,3,2,3,3,3,2,3,2,2,3,2,2,3,2,3,2,3];

% rand AB 5
randAB_5 = [1,2,2,2,3,3,2,2,3,3,3,2,2,3,2,3,3,3,2,3,3,2,2,3,2,3,2,3,2,2,3,2,3,3,2,3,2,3,2,3,2,3,2,2,3,2,2,3,2,3,3,3,2,3,3,2,2,2,3,3,2,3,2,2,2,3,3,2,2,3,3,3,2,3,2,2,3,3,2,2,3,3,3,2,3,3,3,2,3,2,3,2,3,2,2,3,3,2,2,3,2,3,3,2,3,3,2,3,2,3,2,2,3,2,3,2,2,2,3,2,3,2,3,3,3,2];

%% Convert A and B training lists to A rev and B rev training lists

%sub 2 (A) with 4 (Ar) 
%sub 3 (with 5 (Br)

%generate alternative Ar and Br list
alt_Ar_Br = sub_r(alt_AB);

list_5A5B_alt_start_r = sub_r(list_5A5B_alt_start);
list_5A5B_1_r = sub_r(list_5A5B_1);
list_5A5B_2_r = sub_r(list_5A5B_2);

list_3A3B_r = sub_r(list_3A3B);
randAB_1_r = sub_r(randAB_1);
randAB_2_r = sub_r(randAB_2);

randAB_3_r = sub_r(randAB_3);
randAB_4_r = sub_r(randAB_4);
randAB_5_r = sub_r(randAB_5);

%% Save each list to text file

writematrix(alt_Ar_Br,'alt_Ar_Br.txt')
writematrix(list_5A5B_alt_start_r,'list_5A5B_alt_start_r.txt')
writematrix(list_5A5B_1_r,'list_5A5B_1_r.txt')
writematrix(list_5A5B_2_r,'list_5A5B_2_r.txt')

writematrix(list_3A3B_r,'list_3A3B_r.txt')
writematrix(randAB_1_r,'randAB_1_r.txt')
writematrix(randAB_2_r,'randAB_2_r.txt')

writematrix(randAB_3_r,'randAB_3_r.txt')
writematrix(randAB_4_r,'randAB_4_r.txt')
writematrix(randAB_5_r,'randAB_5_r.txt')

%%

%substitue normal trials with reverse trials
function list_r = sub_r(list_AB)
% list_r take normal trials and replaces with reversal trials
list_r = list_AB;
%sub A with Ar
list_r(list_AB == 2) = 4;
%sub B with Br
list_r(list_AB == 3) = 5;

end




