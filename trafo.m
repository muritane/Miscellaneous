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
       
% bewegung 40 (kein Kopf, keine Hände, keine Beine, kein Hals - Torso, Oberarme, Unterarme)
targetNames1 = {'Rarm'; 'Relbow'; 'Rforearm'; 'Larm'; 'Lelbow'; 'Lforearm'; 
               'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder';
               'Neck'; 'Lhips'; 'Rhips'};
% bewegung (Keine obere Kopfhälfte, keine Knien und Füße - Untere Kopfhälfte, Hals, Torso, Arme, Hüfte)
targetNames2 = {'Lthigh'; 'Rthigh'; 'Rhips'; 'Lhips'; 'Neck'; 
               'Rarm'; 'Relbow'; 'Rforearm'; 'Rhand'; 'Larm'; 'Lelbow'; 'Lforearm'; 'Lhand'; 
               'FaceLB'; 'FaceRB'; 'FaceLT'; 'FaceRT'; 'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder'};
% full body static & dynamic
targetNames3 = {'Lfoot'; 'Lleg'; 'Lknee'; 'Lthigh'; 'Rfoot'; 'Rleg'; 'Rknee'; 'Rthigh'; 'Rhips';
    'Lhips'; 'Neck'; 'Rarm'; 'Relbow'; 'Rforearm'; 'Rhand'; 'Larm'; 'Lelbow'; 'Lforearm'; 'Lhand'; 
    'FaceLB'; 'FaceRB'; 'FaceLT'; 'FaceRT'; 'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder'};

targetNamesAll = { targetNames1; targetNames1; targetNames1; 
                   targetNames2; targetNames2; targetNames2; 
                   targetNames3; targetNames3; targetNames3; 
                   targetNames3; targetNames3};

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
             
% for global_i = 1 : size(targetNamesAll, 1)
global_i = 1;

loadCameraCS = strcat('D:\Google drive\HiWi\KIT_cameraCS_250Hz\', loadCameraCSs{global_i,1});    
filename_result = strcat('D:\Google drive\HiWi\New\', filenames_results{global_i,1});
    
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

trafos = zeros(4,4,size(result,1)); % 4x4 homogenous matrices
trigger_frequency = 250; % 250Hz

% Zeitunterschied = geg. Zeitstempel - Anfangszeit
% benötigter Index = Anfangsindex + 250Hz * Zeitunterschied
% berechne die entsprechende homogene Matrix
for i = 1:size(result,1)
    skeleton_calculating_timestamp = posixtime(datetime(result{i,1},'Format',...
        'yyyy/MM/dd/HH:mm:ss.SSSSSS','TimeZone','Europe/Berlin'));
    add_to_begin_index = floor(trigger_frequency * (skeleton_calculating_timestamp - begin_time_without_trigger));
    trafo_index = min(begin_index + add_to_begin_index, size(cam_cs_matrix,1));
%     fprintf('index %d: %d, posix: %f\n',i,trafo_index,skeleton_calculating_timestamp);
    trafos(:,:,i) = [cam_cs_matrix(trafo_index,4), cam_cs_matrix(trafo_index,7), cam_cs_matrix(trafo_index,10), cam_cs_matrix(trafo_index,1)*10^(-3);
                     cam_cs_matrix(trafo_index,5), cam_cs_matrix(trafo_index,8), cam_cs_matrix(trafo_index,11), cam_cs_matrix(trafo_index,2)*10^(-3);
                     cam_cs_matrix(trafo_index,6), cam_cs_matrix(trafo_index,9), cam_cs_matrix(trafo_index,12), cam_cs_matrix(trafo_index,3)*10^(-3);
                                   0,                          0,                             0,                       1];
end

% [x_new, y_new, z_new, 1] = Trafo * [x_old, y_old, z_old, 1]
transformed_body_parts = result;

% for i = 1:size(result,1)
%     for j = 2:size(result,2)
%         temp = trafos(:,:,i)*[transpose(result{i,j});1];
%         transformed_body_parts{i,j} = transpose(temp(1:3));
%     end
% end


% ------------------------------------------------------------------------------
% output -----------------------------------------------------------------------
% ------------------------------------------------------------------------------

targetNames = targetNamesAll{global_i,1};
% outputFileName_fig = outputFileNames_fig_world{global_i,1};
% outputFileName_png = outputFileNames_png_world{global_i,1}; 
% outputFileName_mat = outputFileNames_mat_world{global_i,1};
% outputFileName_csv = outputFileNames_csv_world{global_i,1};

outputFileName_fig = outputFileNames_fig{global_i,1};
outputFileName_png = outputFileNames_png{global_i,1};


fig = figure;
subplot(3,1,1);
% xticks('auto');
hold on
for i = 1:size(targetNames,1)   
    toPlot = transformed_body_parts{:,i+1};
    plot(transformed_body_parts.Time,toPlot(:,1),'o-')
end
hold off

legend(transformed_body_parts.Properties.VariableNames(:,2:size(transformed_body_parts.Properties.VariableNames,2)));

title('x');
% datetick('x');
% xtickformat('HH:mm:ss.SSS');
xlim([transformed_body_parts.Time(1) transformed_body_parts.Time(size(transformed_body_parts.Time,1))]);


timeDiff = transformed_body_parts.Time(size(transformed_body_parts.Time,1)) - transformed_body_parts.Time(1);
timeIncr = 0.1 * timeDiff;
start_time = datetime('2018/08/23/00:00:00.000000','Format',...
        'yyyy/MM/dd/HH:mm:ss.SSSSSS');
timeTicks = transformed_body_parts.Time(1):timeIncr:transformed_body_parts.Time(size(transformed_body_parts.Time,1));
% timeTicks = start_time:timeIncr:(start_time + timeDiff);
% xticks(timeTicks);
set(gca,'XTick',timeTicks)


set(gca, 'xticklabel', [])
yTicks = get(gca,'ytick');
xTicks = get(gca, 'xtick');
minY = min(yTicks);
VerticalOffset = 0.077;
HorizontalOffset = 0.0000058;
for xx = 1:length(xTicks)
    text(xTicks(xx) - HorizontalOffset, minY - VerticalOffset,...
        ['$$\begin{array}{c}',datestr(xTicks(xx),'HH:MM:SS.FFF'),'\\',...
        datestr(xTicks(xx)-xTicks(1),'HH:MM:SS.FFF'),'\end{array}$$'], 'Interpreter', 'latex');
end



subplot(3,1,2);
hold on
for i = 1:size(targetNames,1)   
    toPlot = transformed_body_parts{:,i+1};
    plot(transformed_body_parts.Time,toPlot(:,2),'o-') 
end
hold off
% legend(transformed_body_parts.Properties.VariableNames(:,2:size(transformed_body_parts.Properties.VariableNames,2)))
title('y')
datetick('x');
xtickformat('HH:mm:ss.SSS');
xlim([transformed_body_parts.Time(1) transformed_body_parts.Time(size(transformed_body_parts.Time,1))]);
xticks(timeTicks);

subplot(3,1,3);
hold on
for i = 1:size(targetNames,1)   
    toPlot = transformed_body_parts{:,i+1};
    plot(transformed_body_parts.Time,toPlot(:,3),'o-') 
end
hold off

title('z')
datetick('x');
xtickformat('HH:mm:ss.SSS');

xlim([transformed_body_parts.Time(1) transformed_body_parts.Time(size(transformed_body_parts.Time,1))]);
xticks(timeTicks);

get(gca, 'xtick');
% set(gca, 'xticklabel', []) %Remove tick labels
yTicks = get(gca,'ytick');
xTicks = get(gca, 'xtick');
minX = min(xTicks);
minY = min(yTicks);
VerticalOffset = 0.0001;
HorizontalOffset = 0.0000001;
for xx = 1:length(xTicks)
    text(minX-HorizontalOffset, minY-VerticalOffset, ['$$\begin{array}{c}', datestr(xTicks(xx),'HH:MM:SS.FFF'),'\\', num2str(2.),'\end{array}$$'], 'Interpreter', 'latex')
end



 



% outputFileNameFIG = strcat('D:\Google drive\HiWi\world\', outputFileName_fig);
% outputFileNamePNG = strcat('D:\Google drive\HiWi\world\', outputFileName_png);
% outputFileNameMAT = strcat('D:\Google drive\HiWi\world\', outputFileName_mat);
% outputFileNameCSV = strcat('D:\Google drive\HiWi\world\', outputFileName_csv);


outputFileNameFIG = strcat('D:\Google drive\HiWi\2lines\', outputFileName_fig);
outputFileNamePNG = strcat('D:\Google drive\HiWi\2lines\', outputFileName_png);

savefig(fig,outputFileNameFIG)
% print(outputFileNamePNG,'-dpng','-r0') % bad legend location
% close(fig)

% end

%     outputFileName2 = strcat('D:\Google drive\HiWi\New\csv', outputFileName);
%     save('D:\Google drive\HiWi\Time-250Hz','transformed_body_parts');
%     save(outputFileName2, 'transformed_body_parts');
