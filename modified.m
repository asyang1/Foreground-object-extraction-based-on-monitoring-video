clear;
DIR='D:\��ѧ��ģ\����\data\question5\aft-picture\';        %ͼƬ�����ļ���
file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                         %ͼƬ����
flag= 1;
for num = 1801:filenum 
    fname = strcat(DIR, num2str(num), '.jpg');
    frame = imread(fname);
%     imshow( frame);
%     [r,v] = size(frame);
    
%     for i = 1 :r
%         for j = 1:v
%             if num-1600 >21 && num-1600 <31
%                if i>60 && i<240 && j >90&&j<185
%                    continue;
%                else 
%                    frame(i,j) = 0;
%                    continue;
%                end
%             end
%              if num-1600 >30 && num-1600 < 35
%                if i>60 && i<240 && j >70&&j<181
%                    continue;
%                else 
%                    frame(i,j) = 0;
%                    continue;
%                end
%              end
%              if num-1600 >34
%                if i>60 && i<240 && j >55&&j<127
%                    continue;
%                else 
%                    frame(i,j) = 0;
%                    continue;
%                end
%             end
%             if i>40&& i <220 && j>90 && j<240
%                 continue;
%             else
%                 frame(i,j) = 0;
%             end
%         end
%     end
%     imshow(frame);
%     se = strel('square',2);  %����
%     frame =imdilate(frame,se);
    
    
    for i = 1:20 
        modified_frame= medfilt2(frame,[3,3]);%ʹ����ֵ�˲�ȥ��
    end
   
%     for i = 1:1
%         se=strel('square',2);  %��ʴ
%         modified_frame=imerode(modified_frame,se);
%     end
% %     
%     [L, k_num]=bwlabel(modified_frame,4); %4��ͨ���
%     s=zeros(k_num,1);
%     if k_num ~=0
%         for ii=1:k_num
%             s(ii)=sum(sum(L==ii)); %����ÿ����ͨ��������
%         end
%         [ms, ind]=max(s);
%         modified_frame=(L==ind);
% %         [ss, IX]=sort(s,'descend'); %����Ӵ�С����
% %         modified_frame=xor(modified_frame,L==IX(2)); %��ԭ��ͼ���п۳������С�ŵڶ�������
%     end
   
    
    for i = 1:3
        se = strel('square',2);  %����
        modified_frame =imdilate(modified_frame,se);
    end
    modified_frame = bwareaopen(modified_frame/256,150);   %��ȥС���
    modified_frame=imfill( modified_frame,'holes'); %�
    %modified_frame = imfilter(frame,fspecial('gaussian'))%��˹�˲�
    
%     se=strel('disk',1);  %��ʴ
%     modified_frame=imopen(modified_frame,se);
%     modified_frame=imclose(modified_frame,se);
%     modified_frame=imopen(modified_frame,se);
%     modified_frame=imclose(modified_frame,se);
%     modified_frame=imopen(modified_frame,se);
%     modified_frame=imclose(modified_frame,se);  %�����������
%         [L,kk]=bwlabel(modified_frame,4);
%         x=zeros(1,kk);
%         for ii=1:kk
%             x(ii)=sum(sum(L==ii));
%         end
%         [m,ind]=max(x);
%         modified_frame=(L==ind);
%         for i = 1:2
%             se=strel('square',2);  %��ʴ
%             modified_frame=imerode(modified_frame,se);
%         end
    
    
    imshow(modified_frame);
    imwrite(modified_frame,strcat('D:\��ѧ��ģ\����\data\question5\modified\',num2str(flag),'.jpg'),'jpg');
    flag = flag+1;
end