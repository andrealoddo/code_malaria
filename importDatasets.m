%% Multi-Class SVM
clc
clear
close all

%% Import datasets
ALL_IDB = '/Users/andre/Google Drive/Uni/PhD/Work/Datasets/ALL_IDB';
ALL_IDB1 = '/Users/andre/Google Drive/Uni/PhD/Work/Datasets/ALL_IDB/ALL_IDB1';
ALL_IDB2 = '/Users/andre/Google Drive/Uni/PhD/Work/Datasets/ALL_IDB/ALL_IDB2';
pFalciparumDB = '/Users/andre/Documents/MATLAB/Malaria/1_PlasmodiumFalciparumDataset';
plasmodiumDB = '/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset';

backgroundsDir = fullfile(plasmodiumDB, 'backgrounds');
plasmodiumFalciparum = fullfile(plasmodiumDB, 'Falciparum');
plasmodiumMalariae = fullfile(plasmodiumDB, 'Malariae');
plasmodiumOvale = fullfile(plasmodiumDB, 'Ovale');
plasmodiumVivax = fullfile(plasmodiumDB, 'Vivax');
