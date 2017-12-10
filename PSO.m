%___________________________________________________________________%
%  Grey Wold Optimizer (GWO) source codes version 1.0               %
%                                                                   %
%  Developed in MATLAB R2011b(7.13)                                 %
%                                                                   %
%  Author and programmer: Seyedali Mirjalili                        %
%                                                                   %
%         e-Mail: ali.mirjalili@gmail.com                           %
%                 seyedali.mirjalili@griffithuni.edu.au             %
%                                                                   %
%       Homepage: http://www.alimirjalili.com                       %
%                                                                   %
%   Main paper: S. Mirjalili, S. M. Mirjalili, A. Lewis             %
%               Grey Wolf Optimizer, Advances in Engineering        %
%               Software , in press,                                %
%               DOI: 10.1016/j.advengsoft.2013.12.007               %
%                                                                   %
%___________________________________________________________________%

% Particle Swarm Optimization
function cg_curve=PSO(N,Max_iteration,lb,ub,dim,fobj)

%PSO Infotmation

Vmax=6;
noP=N;
wMax=0.9;
wMin=0.2;
c1=2;
c2=2;

% Initializations
iter=Max_iteration;
vel=zeros(noP,dim);
pBestScore=zeros(noP);
pBest=zeros(noP,dim);
gBest=zeros(1,dim);
cg_curve=zeros(1,iter);

% Random initialization for agents.
pos=initialization(noP,dim,ub,lb); 

for i=1:noP
    pBestScore(i)=inf;
end

% Initialize gBestScore for a minimization problem
 gBestScore=inf;
     
    
for l=1:iter 
    
    % Return back the particles that go beyond the boundaries of the search
    % space
     Flag4ub=pos(i,:)>ub;
     Flag4lb=pos(i,:)<lb;
     pos(i,:)=(pos(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
    
    for i=1:size(pos,1)     
        %Calculate objective function for each particle
        fitness=fobj(pos(i,:));

        if(pBestScore(i)>fitness)
            pBestScore(i)=fitness;
            pBest(i,:)=pos(i,:);
        end
        if(gBestScore>fitness)
            gBestScore=fitness;
            gBest=pos(i,:);
        end
    end

    %Update the W of PSO
    w=wMax-l*((wMax-wMin)/iter);
    %Update the Velocity and Position of particles
    for i=1:size(pos,1)
        for j=1:size(pos,2)       
            vel(i,j)=w*vel(i,j)+c1*rand()*(pBest(i,j)-pos(i,j))+c2*rand()*(gBest(j)-pos(i,j));
            
            if(vel(i,j)>Vmax)
                vel(i,j)=Vmax;
            end
            if(vel(i,j)<-Vmax)
                vel(i,j)=-Vmax;
            end            
            pos(i,j)=pos(i,j)+vel(i,j);
        end
    end
    cg_curve(l)=gBestScore;
end

end