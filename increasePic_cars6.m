clear;
DIR='D:\��ѧ��ģ\����\data\question3\cars6\pre-picture\';        %ͼƬ�����ļ���
file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                         %ͼƬ����

change = cell(filenum,1);
%1-7�ű���ͼ
N = 20;
for current = 1:7
    fname = strcat(DIR, num2str(current), '.jpg');
    frame = imread(fname);
    changeframe  = frame;
    imshow(changeframe);
    fname = strcat(DIR, num2str(30), '.jpg');
    frame = imread(fname);
    exampleframe = frame;
            for i = 139 :168
                for j = 73:180
                    changeframe(i,j) = exampleframe(i-5,j-38);
                end
            end
    imshow(changeframe);
    change{current} = changeframe;
end

%8-15��
for current = 8:15
    fname = strcat(DIR, num2str(current), '.jpg');
    frame = imread(fname);
    changeframe  = frame;
    imshow(changeframe);
    fname = strcat(DIR, num2str(30), '.jpg');
    frame = imread(fname);
    exampleframe = frame;
    for i = 135 :168
        for j = 80:205
            changeframe(i,j) = exampleframe(i,j-25) ;
        end
    end
    imshow(changeframe);
    change{current} = changeframe;
end

%16��22��
for current = 16:22
    fname = strcat(DIR, num2str(current), '.jpg');
    frame = imread(fname);
    changeframe  = frame;
    imshow(changeframe);
    fname = strcat(DIR, num2str(1), '.jpg');
    frame = imread(fname);
    exampleframe = frame;
    imshow(exampleframe);
    for i = 135 :168
        for j = 101:225
            changeframe(i,j) = exampleframe(i+5,j+65) ;
        end
    end
    imshow(changeframe);
    change{current} = changeframe;
end


%23��30��
for current = 23:30
    fname = strcat(DIR, num2str(current), '.jpg');
    frame = imread(fname);
    changeframe  = frame;
    imshow(changeframe);
    fname = strcat(DIR, num2str(1), '.jpg');
    frame = imread(fname);
    exampleframe = frame;
    imshow( exampleframe);
    move = 0;
    for i = 142 :175
        for j = 125+move:285+move
            changeframe(i,j) = exampleframe(i+5,j+35) ;
        end
    end
    imshow(changeframe);
    move = move+15;
    change{current} = changeframe;
end

% mean = (changeframe1+changeframe2+changeframe3)/3;

DIR2='D:\��ѧ��ģ\����\data\question3\cars6\increase\';     %��֡ͼƬ�����ļ���
for i = 1:N
    for num = 1:filenum
        fname = strcat(DIR2, num2str(num+filenum*2*(i-1)), '.jpg');
        imwrite(change{num,1},fname);
    end
    back = 1;
     for num = filenum:-1:1
        fname = strcat(DIR2, num2str(back+30+filenum*2*(i-1)), '.jpg');
        imwrite(change{num,1},fname);
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
for num = 2*filenum*N +1:2*filenum*N+ filenum
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

obj_gray = VideoWriter('D:\��ѧ��ģ\����\data\question3\cars6\increase-cars6.avi');   %��ת���ɵ���Ƶ����
writerFrames = filenum;                       %��Ƶ֡��

%������ͼƬ����avi�ļ�
open(obj_gray);
for k = 1: writerFrames 
    fname = strcat(DIR2, num2str(k), '.jpg');
    frame = imread(fname);
    writeVideo(obj_gray, frame);
end
close(obj_gray);
