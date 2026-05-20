function [sub_all]=dynamic_entropy(data_ori,  sub, wind, node)
% 每个window 下的 entropy
% 划分窗口 [data_slide2]= slidingwindow(a_all_ROI, 50,267, 0.9)
%得到各个窗口的时间数据，输入到 [subXXX]=dynamic_entropy(data_slide2)

% data_ori=data,
% sub= 被试数量
% wind = 窗口数量
% node= 多少个脑区。

  d =data_ori;
  sub=sub;
  row=wind;
  node=node;
 
 for i=1:sub
         dat=d{i,1};
         for j=1: row
                        da=dat{j,1};
                         for ii=1:node
                             entro(j,ii)= pec(da(:,ii)',3,1);
                         end
         end
                    
          sub_all{i,1}=entro;
 end
          