DIR='D:\��ѧ��ģ\����\data\question4\overpass\';        %ͼƬ�����ļ���
fname = strcat(DIR, 'pre-228.jpg');
a1 = imread(fname);
fname = strcat(DIR, '228.jpg');
a2 = imread(fname);
fname = strcat(DIR, 'pre-604.jpg');
b1 = imread(fname);
fname = strcat(DIR, '604.jpg');
b2= imread(fname);
fname = strcat(DIR, 'pre-2478.jpg');
c1 = imread(fname);
fname = strcat(DIR, '2478.jpg');
c2 = imread(fname);

% [r,v] = size(modified);
% % for  i = 1:r
% %     for j = 1:v
% %         if i>60 && i<240 && j >110&&j<180
% %            continue;
% %         else 
% %             modified(i,j) = 0;
% %         end
% %     end
% % end
% result = pre;
% for  i = 1:r
%     for j = 1:v
%         if modified(i,j) == 0
%             result(i,j) = 0;
%         end
% %         if result(i,j) >180
% %             result(i,j) = 0;
% %         end
%     end
% end

subplot(3,2,1);imshow(a1);title('ԭͼ1');
subplot(3,2,2);imshow(a2);title('�Ա�ͼ1');
subplot(3,2,3);imshow(b1);title('ԭͼ2');
subplot(3,2,4);imshow(b2);title('�Ա�ͼ2');
subplot(3,2,5);imshow(c1);title('ԭͼ3');
subplot(3,2,6);imshow(c2);title('�Ա�ͼ3');