%���������ֲ��ܶȵ���Ⱥ���㣊
N = filenum;  %֡��
k = 3;   %ѡ��3���������������Ϊk���ڵĵ㣬�õ������ܳ���3��Ϊ���ܺܶ������㵽�õ�ľ������
original_pic = XX; %����ԭʼ����
result= zeros(rows,N); %�����������Ĵ�С

%���ֵ����ͼ
mXX = mean(XX , 2);
DIR='D:\��ѧ��ģ\����\data\question1\office\background\';     %��֡ͼƬ�����ļ���

x= mXX;
frameNew=reshape(x,size(frame,1),size(frame,2));
% se=strel('disk',6);
% frameNew1=imopen(frameNew,se);
% frameNew2=imclose(frameNew1,se);
fname = strcat(DIR, num2str(1), '.jpg');
imwrite(frameNew/256,fname);

%��ʼ������ģ�ͣ����õ�֡��ʼ����640*480����������Ϊ8
N0 = 8;  %��������Ϊ8
[f_r,f_v] = size(frame);
mXX = reshape(mXX,120,160); %��ȡ�ռ��ϵ�����
background = zeros(rows,4); %��ʼ������ģ�;���
flag = 1;
for i = 1:f_r
   for j = 1:f_v
       if  i == 1 && j == 1
            background(flag,1) = mXX(1,1);
            background(flag,2) = mXX(1,2);
            background(flag,3) = mXX(2,1);
            background(flag,4) = mXX(2,2);
            background(flag,5) = mXX(1,1);
            background(flag,6) = mXX(1,2);
            background(flag,7) = mXX(2,1);
            background(flag,8) = mXX(2,2);
       elseif i == 1 && j == f_v
            background(flag,1) = mXX(1,f_v);
            background(flag,2) = mXX(1,f_v-1);
            background(flag,3) = mXX(2,f_v);
            background(flag,4) = mXX(2,f_v-1);
            background(flag,5) = mXX(1,f_v);
            background(flag,6) = mXX(1,f_v-1);
            background(flag,7) = mXX(2,f_v);
            background(flag,8) = mXX(2,f_v-1);
       elseif i == f_r && j == 1
            background(flag,1) = mXX(f_r,1);
            background(flag,2) = mXX(f_r-1,1);
            background(flag,3) = mXX(f_r-1,2);
            background(flag,4) = mXX(f_r,2);
            background(flag,5) = mXX(f_r,1);
            background(flag,6) = mXX(f_r-1,1);
            background(flag,7) = mXX(f_r-1,2);
            background(flag,8) = mXX(f_r,2);
       elseif i == f_r && j == f_v
            background(flag,1) = mXX(f_r,f_v);
            background(flag,2) = mXX(f_r,f_v-1);
            background(flag,3) = mXX(f_r-1,f_v);
            background(flag,4) = mXX(f_r-1,f_v-1);
            background(flag,5) = mXX(f_r,f_v);
            background(flag,6) = mXX(f_r,f_v-1);
            background(flag,7) = mXX(f_r-1,f_v);
            background(flag,8) = mXX(f_r-1,f_v-1);
       elseif  i == 1 && j >1 && j < f_v
            background(flag,1) = mXX(1,j);
            background(flag,2) = mXX(1,j-1);
            background(flag,3) = mXX(1,j+1);
            background(flag,4) = mXX(2,j);
            background(flag,5) = mXX(1,j);
            background(flag,6) = mXX(1,j-1);
            background(flag,7) = mXX(1,j+1);
            background(flag,8) = mXX(2,j);
       elseif  i == f_r && j >1 && j < f_v
            background(flag,1) = mXX(f_r,j);
            background(flag,2) = mXX(f_r,j-1);
            background(flag,3) = mXX(f_r,j+1);
            background(flag,4) = mXX(f_r-1,j);
            background(flag,5) = mXX(f_r,j);
            background(flag,6) = mXX(f_r,j-1);
            background(flag,7) = mXX(f_r,j+1);
            background(flag,8) = mXX(f_r-1,j);
       elseif  j == 1 && i >1 && i < f_r
            background(flag,1) = mXX(i,1);
            background(flag,2) = mXX(i-1,1);
            background(flag,3) = mXX(i+1,1);
            background(flag,4) = mXX(i,2);
            background(flag,5) = mXX(i,1);
            background(flag,6) = mXX(i-1,1);
            background(flag,7) = mXX(i+1,1);
            background(flag,8) = mXX(i,2);
       elseif   j == f_v && i >1 && i < f_r
            background(flag,1) = mXX(i,f_v);
            background(flag,2) = mXX(i-1,f_v);
            background(flag,3) = mXX(i+1,f_v);
            background(flag,4) = mXX(i,f_v-1);
            background(flag,5) = mXX(i,f_v);
            background(flag,6) = mXX(i-1,f_v);
            background(flag,7) = mXX(i+1,f_v);
            background(flag,8) = mXX(i,f_v-1);
       else
            background(flag,1) = mXX(i,j);
            background(flag,2) = mXX(i,j+1);
            background(flag,3) = mXX(i,j-1);
            background(flag,4) = mXX(i+1,j+1);
            background(flag,5) = mXX(i+1,j);
            background(flag,6) = mXX(i+1,j-1);
            background(flag,7) = mXX(i-1,j+1);
            background(flag,8) = mXX(i-1,j);
       end
       flag = flag + 1;
   end
end



%�жϱ�������
Nstart = 1; %�趨��ʼ֡
for point_num = 1:rows
   current = original_pic(point_num,:);  
   for per = Nstart: filenum
        p_near = cell(5,N0);  %��ʼ������һ���������k_near,�ڶ���������žֲ��ɴ��ܶ�
        background(point_num,N0+1) = current(1,per); %��ȡ��ǰ֡�����طŵ�����������һλ
        for s_num = 1:N0+1
           k_flag = 1;
           k_dis = zeros(2,N0);
           for i = 1:N0+1

               if i == s_num  %�ֵ��˵㱾�������������о�����ȡ
                  continue; 
               end

                k_dis(1,k_flag) = abs(background(point_num,s_num) - background(point_num,i)); %�����֡�ĵ㵽���е�ľ���
                k_dis(2,k_flag) = i;  %����õ��λ��
                k_flag = k_flag + 1;
           end
           ksort_dis = sortrows( k_dis',1)';  %��k_dis��С��������

           %ȷ������k���ڵĸ��������ڿ��ܳ��־�����ȵ�������������ܴ���k
           for i = 1:N0

               if i == N0  %��i����N0 - 1��û��ѭ���꣬�����еĵ㶼��k���ڵĵ�
                   break;
               end
               flag = 0;
               if ksort_dis(1,i+1) == ksort_dis(1,i)
                   flag = 1;
               end
               if  i >= k  && flag ==0 
                   maxk_dis = ksort_dis(1,i);
                   k_length = i;
                   break;
               end
           end

           p_near{1,s_num} = ksort_dis(:,1:k_length); %��k��ֵ���浽k_near��

           %������ǰ��Ŀɴ����
           reach_near = ksort_dis(:,1:k_length);
           reach_sum = 0
           for i = 1:k_length
              if reach_near(1,i) < maxk_dis
                  reach_near(1,i) = maxk_dis;
              end
              reach_sum = reach_sum + reach_near(1,i);
           end

           lrdk_p = 1/(reach_sum/k_length); %��ֲ��ɴ��ܶ�

           %Ϊ�˱��ں������㣬���������Ϊ100
           if lrdk_p  == inf   
               lrdk_p = 100;
           end

           p_near{2,s_num} = lrdk_p; %���䱣����p_near�ڶ���  
           p_near{3,s_num} = k_length;  %�����б���k���ڵ�����������С��Nk

        end

        %�����������صı�������
        for num = 1:N0+1
           sum = 0;
           Nk = p_near{3,num};
           for i = 1:Nk
               q_flag =  p_near{1,num}(2,i);  %ȡ��������Ľű�
               sum = sum + p_near{2,q_flag}/p_near{2,num};  %�ۼ�
           end
           p_near{4,num} = sum/Nk;
           p_near{5,num} = num;
        end

        %�жϸ�֡���ص��Ƿ�Ϊ��������
        sum = 0;
        Nk = p_near{3,N0+1};

        %��Ϊһ��ֲ��ɴ��ܶ��������ֱ�ӽ��õ���Ϊ��������
        if p_near{2,N0+1} == 100
           temp = 0;
           continue;
        end

        for i = 1:p_near{3,N0+1}
           q_flag =  p_near{1,N0+1}(2,i);  %ȡ��������Ľű�
           sum = sum + p_near{4,q_flag};  %�ۼӾֲ���������LBF
        end
        mean = sum/N0 ;  %��õ����صĽ������������LBF��ֵ

        if p_near{4,num} > mean
           temp = 0;
        else
           temp = 1;
        end
        
%         %����ǰ����Ϊ��������,����б���ģ�͵���
%         if temp == 0
%             p_near = sortrows(p_near',4)';
%             if p_near{5,1} ~= N0+1
%                 background(point_num,p_near{5,1}) = current(1,per);
%             end
%         end
       
        result(point_num,per) = temp;
   end
end

XXnew = original_pic;
for i=1:rows
    for j=1:N    
        if result(i,j) == 0
            XXnew(i,j) =  0;
        end
    end
end

DIR='D:\��ѧ��ģ\����\data\question1\office\aft-picture\';     %��֡ͼƬ�����ļ���

for k = 1: N  %������ԭΪfilenum-1��ͼƬ
    x= XXnew(:,k);
    frameNew=reshape(x,size(frame,1),size(frame,2));
    se=strel('disk',6);
    frameNew1=imopen(frameNew,se);
    frameNew2=imclose(frameNew1,se);
    fname = strcat(DIR, num2str(k), '.jpg');
    imwrite(frameNew/256,fname);
end


