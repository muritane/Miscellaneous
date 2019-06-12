clear;
clc;
close all;
format long;

fst_timestamps_after_trigger_id = [ 38;
                                   39;
                                   40;
                                   35;
                                   36;
                                   37;
                                   30;
                                   31;
                                   32;
                                   33;
                                   34];
                               
fst_timestamps_after_trigger = [ 1535032727.786519;
                                1535032875.558160;
                                1535033028.457225;
                                1535031780.806470;
                                1535031994.035716;
                                1535032171.249686;
                                1535029910.027839; 
                                1535030032.759582; 
                                1535030201.529307;
                                1535030951.921615;
                                1535030642.484313];
       
% bewegung 40 (kein Kopf, keine H�nde, keine Beine, kein Hals - Torso, Oberarme, Unterarme)
targetNames1 = {'Rarm'; 'Relbow'; 'Rforearm'; 'Larm'; 'Lelbow'; 'Lforearm'; 
               'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder';
               'Neck'; 'Lhips'; 'Rhips'};
% bewegung (Keine obere Kopfh�lfte, keine Knien und F��e - Untere Kopfh�lfte, Hals, Torso, Arme, H�fte)
targetNames2 = {'Lthigh'; 'Rthigh'; 'Rhips'; 'Lhips'; 'Neck'; 
               'Rarm'; 'Relbow'; 'Rforearm'; 'Rhand'; 'Larm'; 'Lelbow'; 'Lforearm'; 'Lhand'; 
               'FaceLB'; 'FaceRB'; 'FaceLT'; 'FaceRT'; 'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder'};
% full body static & dynamic
targetNames3 = {'Lfoot'; 'Lleg'; 'Lknee'; 'Lthigh'; 'Rfoot'; 'Rleg'; 'Rknee'; 'Rthigh'; 'Rhips';
    'Lhips'; 'Neck'; 'Rarm'; 'Relbow'; 'Rforearm'; 'Rhand'; 'Larm'; 'Lelbow'; 'Lforearm'; 'Lhand'; 
    'FaceLB'; 'FaceRB'; 'FaceLT'; 'FaceRT'; 'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder'};

targetNames4 = {'Point1'; 'Point2'; 'Point3'; 'Point4'; 'Point5'; 'Point6'; 'Point7'; 
            'Point8'; 'Point9'; 'Point10'; 'Point11'; 'Point12'; 'Point13'; 'Point14'; 
            'Point15'; 'Point16'; 'Point17'; 'Point18'; 'Point19'; 'Point20'; 'Point21'; 
            'Point22'; 'Point23'; 'Point24'; 'Point25'; };


%targetNamesAll = { targetNames1; targetNames1; targetNames1; 
%                   targetNames2; targetNames2; targetNames2; 
%                   targetNames3; targetNames3; targetNames3; 
%                   targetNames3; targetNames3};
targetNamesAll = { targetNames4; targetNames4; targetNames4; 
                   targetNames4; targetNames4; targetNames4; 
                   targetNames4; targetNames4; targetNames4; 
                   targetNames4; targetNames4};

outputFileNames_fig = { '38_2018-08-23-15-58-42_bewegung-40.fig';
                    '39_2018-08-23-16-01-04_bewegung-40.fig';
                    '40_2018-08-23-16-03-41_bewegung-40.fig';
                    '35_2018-08-23-15-42-48_bewegung.fig';
                    '36_2018-08-23-15-46-28_bewegung.fig';
                    '37_2018-08-23-15-49-22_bewegung.fig';
                    '30_2018-08-23-15-11-44_full-body-static.fig';
                    '31_2018-08-23-15-13-43_full-body-static.fig';
                    '32_2018-08-23-15-16-40_full-body-static.fig';
                    '33_2018-08-23-15-29-03_full-body-dynamic.fig';
                    '34_2018-08-23-15-24-00_full-body-dynamic.fig'};
outputFileNames_png = { '38_2018-08-23-15-58-42_bewegung-40.png';
                    '39_2018-08-23-16-01-04_bewegung-40.png';
                    '40_2018-08-23-16-03-41_bewegung-40.png';
                    '35_2018-08-23-15-42-48_bewegung.png';
                    '36_2018-08-23-15-46-28_bewegung.png';
                    '37_2018-08-23-15-49-22_bewegung.png';
                    '30_2018-08-23-15-11-44_full-body-static.png';
                    '31_2018-08-23-15-13-43_full-body-static.png';
                    '32_2018-08-23-15-16-40_full-body-static.png';
                    '33_2018-08-23-15-29-03_full-body-dynamic.png';
                    '34_2018-08-23-15-24-00_full-body-dynamic.png'};

outputFileNames_csv_world = { '38_2018-08-23-15-58-42_bewegung-40_world.csv';
                    '39_2018-08-23-16-01-04_bewegung-40_world.csv';
                    '40_2018-08-23-16-03-41_bewegung-40_world.csv';
                    '35_2018-08-23-15-42-48_bewegung_world.csv';
                    '36_2018-08-23-15-46-28_bewegung_world.csv';
                    '37_2018-08-23-15-49-22_bewegung_world.csv';
                    '30_2018-08-23-15-11-44_full-body-static_world.csv';
                    '31_2018-08-23-15-13-43_full-body-static_world.csv';
                    '32_2018-08-23-15-16-40_full-body-static_world.csv';
                    '33_2018-08-23-15-29-03_full-body-dynamic_world.csv';
                    '34_2018-08-23-15-24-00_full-body-dynamic_world.csv'};
outputFileNames_mat_world = { '38_2018-08-23-15-58-42_bewegung-40_world.mat';
                    '39_2018-08-23-16-01-04_bewegung-40_world.mat';
                    '40_2018-08-23-16-03-41_bewegung-40_world.mat';
                    '35_2018-08-23-15-42-48_bewegung_world.mat';
                    '36_2018-08-23-15-46-28_bewegung_world.mat';
                    '37_2018-08-23-15-49-22_bewegung_world.mat';
                    '30_2018-08-23-15-11-44_full-body-static_world.mat';
                    '31_2018-08-23-15-13-43_full-body-static_world.mat';
                    '32_2018-08-23-15-16-40_full-body-static_world.mat';
                    '33_2018-08-23-15-29-03_full-body-dynamic_world.mat';
                    '34_2018-08-23-15-24-00_full-body-dynamic_world.mat'};
outputFileNames_fig_world = { '38_2018-08-23-15-58-42_bewegung-40_world.fig';
                    '39_2018-08-23-16-01-04_bewegung-40_world.fig';
                    '40_2018-08-23-16-03-41_bewegung-40_world.fig';
                    '35_2018-08-23-15-42-48_bewegung_world.fig';
                    '36_2018-08-23-15-46-28_bewegung_world.fig';
                    '37_2018-08-23-15-49-22_bewegung_world.fig';
                    '30_2018-08-23-15-11-44_full-body-static_world.fig';
                    '31_2018-08-23-15-13-43_full-body-static_world.fig';
                    '32_2018-08-23-15-16-40_full-body-static_world.fig';
                    '33_2018-08-23-15-29-03_full-body-dynamic_world.fig';
                    '34_2018-08-23-15-24-00_full-body-dynamic_world.fig'};
outputFileNames_png_world = { '38_2018-08-23-15-58-42_bewegung-40_world.png';
                    '39_2018-08-23-16-01-04_bewegung-40_world.png';
                    '40_2018-08-23-16-03-41_bewegung-40_world.png';
                    '35_2018-08-23-15-42-48_bewegung_world.png';
                    '36_2018-08-23-15-46-28_bewegung_world.png';
                    '37_2018-08-23-15-49-22_bewegung_world.png';
                    '30_2018-08-23-15-11-44_full-body-static_world.png';
                    '31_2018-08-23-15-13-43_full-body-static_world.png';
                    '32_2018-08-23-15-16-40_full-body-static_world.png';
                    '33_2018-08-23-15-29-03_full-body-dynamic_world.png';
                    '34_2018-08-23-15-24-00_full-body-dynamic_world.png'};                
                
loadCameraCSs = {'KIT38_cameraCS_250Hz.mat';
                 'KIT39_cameraCS_250Hz.mat';
                 'KIT40_cameraCS_250Hz.mat';
                 'KIT35_cameraCS_250Hz.mat';
                 'KIT36_cameraCS_250Hz.mat';
                 'KIT37_cameraCS_250Hz.mat';
                 'KIT30_cameraCS_250Hz.mat';
                 'KIT31_cameraCS_250Hz.mat';
                 'KIT32_cameraCS_250Hz.mat';
                 'KIT33_cameraCS_250Hz.mat';
                 'KIT34_cameraCS_250Hz.mat'};                
                            
filenames_results = { '38_2018-08-23-15-58-42_bewegung-40.mat';
                    '39_2018-08-23-16-01-04_bewegung-40.mat';
                    '40_2018-08-23-16-03-41_bewegung-40.mat';
                    '35_2018-08-23-15-42-48_bewegung.mat';
                    '36_2018-08-23-15-46-28_bewegung.mat';
                    '37_2018-08-23-15-49-22_bewegung.mat';
                    '30_2018-08-23-15-11-44_full-body-static.mat';
                    '31_2018-08-23-15-13-43_full-body-static.mat';
                    '32_2018-08-23-15-16-40_full-body-static.mat';
                    '33_2018-08-23-15-29-03_full-body-dynamic.mat';
                    '34_2018-08-23-15-24-00_full-body-dynamic.mat'};         
                
tick_label_offset = [0.082, 0.000006, 0.18, 0.000006, 0.18, 0.000006;
                     0.68, 0.000006, 0.9, 0.000006, 0.18, 0.000006;
                     0.68, 0.000006, 0.9, 0.000006, 0.8, 0.000006;
                     0.15, 0.000005, 0.18, 0.000005, 0.3, 0.000005;
                     0.07, 0.0000047, 0.18, 0.0000047, 0.3, 0.0000047;
                     0.15, 0.0000076, 0.31, 0.0000076, 0.01, 0.0000076;
                     0.8, 0.0000024, 0.25, 0.0000024, 0.2, 0.0000024;
                     0.4, 0.0000027, 0.53, 0.0000027, 0.27, 0.0000027;
                     0.95, 0.000002, 0.7, 0.000002, 0.4, 0.000002;
                     0.85, 0.000004, 0.4, 0.000004, 0.2, 0.000004;
                     1.45, 0.0000065, 0.7, 0.0000065, 0.45, 0.0000065]; 
                 
tick_label_offset_world = [1.6, 0.000006, 0.3, 0.000006, 0.27, 0.000006;
                     1.6, 0.000006, 0.37, 0.000006, 0.27, 0.000006;
                     3.0, 0.000006, 0.37, 0.000006, 0.9, 0.000006;
                     1.5, 0.000005, 0.3, 0.000005, 0.33, 0.000005;
                     1.5, 0.0000047, 0.3, 0.0000047, 0.1, 0.0000047;
                     1.5, 0.0000076, 0.35, 0.0000076, 0.34, 0.0000076;
                     0.85, 0.0000024, 0.3, 0.0000024, 0.2, 0.0000024;
                     0.35, 0.0000027, 0.53, 0.0000027, 0.8, 0.0000027;
                     1.45, 0.000002, 0.6, 0.000002, 0.32, 0.000002;
                     0.9, 0.000004, 0.9, 0.000004, 0.2, 0.000004;
                     1.5, 0.0000065, 0.7, 0.0000065, 0.9, 0.0000065];          
                 
                 
% for global_i = 1 : size(targetNamesAll, 1)
global_i = 1;

loadCameraCS = strcat('E:\Google drive\HiWi\KIT_cameraCS_250Hz\', loadCameraCSs{global_i,1});    
filename_result = strcat('E:\Google drive\HiWi\KUKA\output\', filenames_results{global_i,1});
    
load(loadCameraCS);
load(filename_result); 


begin_time_without_trigger = fst_timestamps_after_trigger(global_i,1);
              
% berechne Anfangsindex: wenn > 1                            
begin_index = -1;
trigger_threshold = 1.;
for i = 2:size(cam_cs_matrix,1)
    if cam_cs_matrix(i, size(cam_cs_matrix,2)) < trigger_threshold && ...
            cam_cs_matrix(i-1, size(cam_cs_matrix,2)) > trigger_threshold
        begin_index = i;
        break;
    end
end

result = kuka_tracking_points;

trafos = zeros(4,4,size(result,1)); % 4x4 homogenous matrices
trigger_frequency = 250; % 250Hz

% Zeitunterschied = geg. Zeitstempel - Anfangszeit
% benoetigter Index = Anfangsindex + 250Hz * Zeitunterschied
% berechne die entsprechende homogene Matrix
for i = 1:size(result,1)
%     skeleton_calculating_timestamp = posixtime(datetime(result{i,1},'Format',...
%         'yyyy/MM/dd/HH:mm:ss.SSSSSS','TimeZone','Europe/Berlin'));
%     add_to_begin_index = floor(trigger_frequency * (skeleton_calculating_timestamp - begin_time_without_trigger));
    trafo_index = min(begin_index, size(cam_cs_matrix,1));
%     fprintf('index %d: %d, posix: %f\n',i,trafo_index,skeleton_calculating_timestamp);
    trafos(:,:,i) = [cam_cs_matrix(trafo_index,4), cam_cs_matrix(trafo_index,7), cam_cs_matrix(trafo_index,10), cam_cs_matrix(trafo_index,1)*10^(-3);
                     cam_cs_matrix(trafo_index,5), cam_cs_matrix(trafo_index,8), cam_cs_matrix(trafo_index,11), cam_cs_matrix(trafo_index,2)*10^(-3);
                     cam_cs_matrix(trafo_index,6), cam_cs_matrix(trafo_index,9), cam_cs_matrix(trafo_index,12), cam_cs_matrix(trafo_index,3)*10^(-3);
                                   0,                          0,                             0,                       1];
end

% [x_new, y_new, z_new, 1] = Trafo * [x_old, y_old, z_old, 1]
transformed_points = result;

for i = 1:size(result,1)
    for j = 2:size(result,2)
        temp = trafos(:,:,i)*[transpose(result{i,j});1];
        transformed_points{i,j} = transpose(temp(1:3));
    end
end


% ------------------------------------------------------------------------------
% output -----------------------------------------------------------------------
% ------------------------------------------------------------------------------

targetNames = targetNamesAll{global_i,1};
outputFileName_fig = outputFileNames_fig_world{global_i,1};
% outputFileName_png = outputFileNames_png_world{global_i,1}; 
outputFileName_mat = outputFileNames_mat_world{global_i,1};
outputFileName_csv = outputFileNames_csv_world{global_i,1};

% outputFileName_fig = outputFileNames_fig{global_i,1};
% outputFileName_png = outputFileNames_png{global_i,1};

timeDiff = transformed_points.Time(size(transformed_points.Time,1)) - transformed_points.Time(1);
timeIncr = 0.1 * timeDiff;
timeTicks = transformed_points.Time(1):timeIncr:transformed_points.Time(size(transformed_points.Time,1));

fig = figure;
subplot(3,1,1);
hold on
for i = 1:size(targetNames,1)   
    toPlot = transformed_points{:,i+1};
    plot(transformed_points.Time,toPlot(:,1),'o-')
end
hold off

legend(transformed_points.Properties.VariableNames(:,2:size(transformed_points.Properties.VariableNames,2)));

title('x');
xlim([transformed_points.Time(1) transformed_points.Time(size(transformed_points.Time,1))]);
set(gca,'XTick',timeTicks)
% set(gca, 'xticklabel', [])
% yTicks = get(gca,'ytick');
% xTicks = get(gca, 'xtick');
% minY = min(yTicks);
% VerticalOffset = tick_label_offset_world(global_i, 1);
% HorizontalOffset = tick_label_offset_world(global_i, 2);
% fprintf('x: %s, %f\n', datestr(xTicks(1) - HorizontalOffset,'HH:MM:SS.FFF'), minY - VerticalOffset);
% for xx = 1:length(xTicks)
%     text(xTicks(xx) - HorizontalOffset, minY - VerticalOffset,...
%         ['$$\begin{array}{c}',datestr(xTicks(xx),'HH:MM:SS.FFF'),'\\',...
%         datestr(xTicks(xx)-xTicks(1),'HH:MM:SS.FFF'),'\end{array}$$'], 'Interpreter', 'latex');
% end



subplot(3,1,2);
hold on
for i = 1:size(targetNames,1)   
    toPlot = transformed_points{:,i+1};
    plot(transformed_points.Time,toPlot(:,2),'o-') 
end
hold off

title('y')
xlim([transformed_points.Time(1) transformed_points.Time(size(transformed_points.Time,1))]);
set(gca,'XTick',timeTicks)
% set(gca, 'xticklabel', [])
% yTicks = get(gca,'ytick');
% xTicks = get(gca, 'xtick');
% minY = min(yTicks);
% VerticalOffset = tick_label_offset_world(global_i, 3);
% HorizontalOffset = tick_label_offset_world(global_i, 4);
% fprintf('y: %s, %f\n', datestr(xTicks(1) - HorizontalOffset,'HH:MM:SS.FFF'), minY - VerticalOffset);
% for xx = 1:length(xTicks)
%     text(xTicks(xx) - HorizontalOffset, minY - VerticalOffset,...
%         ['$$\begin{array}{c}',datestr(xTicks(xx),'HH:MM:SS.FFF'),'\\',...
%         datestr(xTicks(xx)-xTicks(1),'HH:MM:SS.FFF'),'\end{array}$$'], 'Interpreter', 'latex');
% end

subplot(3,1,3);
hold on
for i = 1:size(targetNames,1)   
    toPlot = transformed_points{:,i+1};
    plot(transformed_points.Time,toPlot(:,3),'o-') 
end
hold off

title('z')
xlim([transformed_points.Time(1) transformed_points.Time(size(transformed_points.Time,1))]);
set(gca,'XTick',timeTicks)
% set(gca, 'xticklabel', [])
% yTicks = get(gca,'ytick');
% xTicks = get(gca, 'xtick');
% minY = min(yTicks);
% VerticalOffset = tick_label_offset_world(global_i, 5);
% HorizontalOffset = tick_label_offset_world(global_i, 6);
% fprintf('z: %s, %f\n', datestr(xTicks(1) - HorizontalOffset,'HH:MM:SS.FFF'), minY - VerticalOffset);
% for xx = 1:length(xTicks)
%     text(xTicks(xx) - HorizontalOffset, minY - VerticalOffset,...
%         ['$$\begin{array}{c}',datestr(xTicks(xx),'HH:MM:SS.FFF'),'\\',...
%         datestr(xTicks(xx)-xTicks(1),'HH:MM:SS.FFF'),'\end{array}$$'], 'Interpreter', 'latex');
% end



 


save_path = 'E:\Google drive\HiWi\KUKA\world';
outputFileNameFIG = strcat(save_path, outputFileName_fig);
outputFileNameMAT = strcat(save_path, outputFileName_mat);
outputFileNameCSV = strcat(save_path, outputFileName_csv);

% savefig(fig,outputFileNameFIG)
% writetable(transformed_points,outputFileNameCSV,'Delimiter',',','WriteRowNames',true);
% save(outputFileNameMAT, 'transformed_points');
