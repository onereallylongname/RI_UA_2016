function [  ] = Animatecell(h, obj, dt, sd)
%=============================================================================%
%ANIMATECELL Summary of this function goes here
%   Detailed explanation goes here
%=============================================================================%

global GCONFIG
%=============================================================================%

%=============================================================================%
    NN = [size(obj(10).AAA,4), size(obj(11).AAA,4),size(obj(12).AAA,4)];
    
    time=[13 53	93	133	173	213
        33	73	113	153	193	233
        58	98	138	178	218	258
        79	119	159	199	239	279];
%=============================================================================%

%=============================================================================%
  if GCONFIG(4)
    hold on
    hh(1) = plot3(obj(10).xyz(1,1),obj(10).xyz(1,2),obj(10).xyz(1,3),'>g','MarkerSize',3);
    hh(2) = plot3(obj(12).xyz(1,1),obj(12).xyz(1,2),obj(12).xyz(1,3),'>r','MarkerSize',3);
    hh(3) = plot3(obj(11).xyz(1,1),obj(11).xyz(1,2),obj(11).xyz(1,3),'>k','MarkerSize',3);
    hold off
  end
    
    
   for k = 1:max(NN)
       for kk = 10:12
           if(k < NN(kk-9))
                org = LinkOrigins2(obj(kk).AAA(:,:,:,k), obj(kk).T);
                set(h(kk),'Xdata',org(1,:),'Ydata',org(2,:),'Zdata',org(3,:));
              if(k >= time(1)/dt && k <= time(2)/dt)
                       setobjt(h, obj, 4, 10,k)
              end
              if(k >= time(3)/dt && k <= time(4)/dt)
                       setobjt(h, obj, 4, 11,k)
              end
              if(k >= time(5)/dt && k <= time(6)/dt)
                       setobjt(h, obj, 5, 10,k)
              end
              if(k >= time(7)/dt && k <= time(8)/dt)
                       setobjt(h, obj, 5, 11,k)
              end
              if(k >= time(9)/dt && k <= time(10)/dt)
                       setobjt(h, obj, 6, 10,k)
              end
              if(k >= time(11)/dt && k <= time(12)/dt)
                      setobjt(h, obj, 6, 11,k)
              end
              if(k >= time(13)/dt && k <= time(14)/dt)
                       setobjt(h, obj, 7, 10,k)
              end
              if(k >= time(15)/dt && k <= time(16)/dt)
                       setobjt(h, obj, 7, 11,k)
              end
              if(k >= time(17)/dt && k <= time(18)/dt)
                       setobjt(h, obj, 8, 10,k)
              end
              if(k >= time(19)/dt && k <= time(20)/dt)
                       setobjt(h, obj, 8, 11,k)
              end
              if(k >= time(21)/dt && k <= time(22)/dt)
                       setobjt(h, obj, 9, 10,k)
              end
              if(k >= time(23)/dt && k <= time(24)/dt)
                       setobjt(h, obj, 9, 11,k)
              end
              if GCONFIG(4)
                  if ((k+10) < NN(kk-9))
                    set(hh(kk-9), 'Xdata',obj(kk).xyz(k:k+10,1),'Ydata',obj(kk).xyz(k:k+10,2),'Zdata',obj(kk).xyz(k:k+10,3));                  
                  end
              end
           end
       end
       pause(sd);
   end

end



