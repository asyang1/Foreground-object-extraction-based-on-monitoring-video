clear; clc; close all;
DIR='D:\��ѧ��ģ\����\data\question4\overpass\aft-picture\';        %ͼƬ�����ļ���
file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                         %ͼƬ����

flag= 1;
for num = 1:filenum 
    fname = strcat(DIR, num2str(num), '.jpg');
    frame = imread(fname);
    
    %ʹ����ֵ�˲�ȥ��
    for i = 1:20 
        modified_frame= medfilt2(frame,[3,3]);
    end
    
    %����
    for i = 1:3
        se = strel('square',2);  
        modified_frame =imdilate(modified_frame,se);
    end
    
    %��ȥС���
    modified_frame = bwareaopen(modified_frame/256,150);  
    
    %�
    modified_frame=imfill( modified_frame,'holes');
    
    imshow(modified_frame);
    imwrite(modified_frame,strcat('D:\��ѧ��ģ\����\data\question4\overpass\modified\',num2str(flag),'.jpg'),'jpg');
    flag = flag+1;
end