clear;
DIR='D:\��ѧ��ģ\����\data\question5\pre-picture\';        %ͼƬ�����ļ���
% file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
filenum1= 30;                         %����ͼƬ����

DIR2='D:\��ѧ��ģ\����\data\question5\background\';     %��֡ͼƬ�����ļ���
N = 30;

for i = 1:N
     for num = 1:filenum1
        fname = strcat(DIR, num2str(num), '.jpg');
        frame = imread(fname); 
        fname = strcat(DIR2, num2str(num+filenum1*2*(i-1)), '.jpg');
        imwrite(frame,fname);
     end
     back = 1;
     for num = filenum1:-1:1
        fname = strcat(DIR, num2str(num), '.jpg');
        frame = imread(fname); 
        fname = strcat(DIR2, num2str(back+30+filenum1*2*(i-1)), '.jpg');
        imwrite(frame,fname);
        back = back+1;
     end
end

% fname = strcat(DIR2, '0.jpg');
% imwrite(mean,fname);


% % DIR2='D:\��ѧ��ģ\����\data\question3\cars6\aft-picture\';     %��֡ͼƬ�����ļ���
% for i = N*(sample-1) +1:N*(sample-1) + N
%     fname = strcat(DIR2, num2str(i), '.jpg');
%     imwrite(changeframe,fname);
% end
% 
% 
% 
% % DIR2='D:\��ѧ��ģ\����\data\question3\cars6\aft-picture\';     %��֡ͼƬ�����ļ���
% for i = N*(sample-1) +1:N*(sample-1) + N
%     fname = strcat(DIR2, num2str(i), '.jpg');
%     imwrite(changeframe,fname);
% end



% DIR2='D:\��ѧ��ģ\����\data\question3\cars6\aft-picture\';     %��֡ͼƬ�����ļ���
i = 1;
file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                         %ͼƬ����
for num = 2*filenum1*N +1:2*filenum1*N+ filenum
    fname = strcat(DIR, num2str(i), '.jpg');
    frame = imread(fname);
    fname = strcat(DIR2, num2str(num), '.jpg');
    imwrite(frame,fname);
    i = i+1;
end

%�����е�֡ͼƬת��Ϊ��Ƶ
% DIR2='D:\��ѧ��ģ\����\data\question3\cars6\increase\';        %ͼƬ�����ļ���
file=dir(strcat(DIR2,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                         %ͼƬ����

obj_gray = VideoWriter('D:\��ѧ��ģ\����\data\question5\increase_boom.avi');   %��ת���ɵ���Ƶ����
writerFrames = filenum;                       %��Ƶ֡��

%������ͼƬ����avi�ļ�
open(obj_gray);
for k = 1: writerFrames 
    fname = strcat(DIR2, num2str(k), '.jpg');
    frame = imread(fname);
    writeVideo(obj_gray, frame);
end
close(obj_gray);
