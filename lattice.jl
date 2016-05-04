nh=Nx*Ny
ivic=zeros(Int64,nh,4)


# PBC in two dimensions
ii=1

for j = 1:Ny
    for i = 1:Nx

       #right  (1)
       if i==Nx
          ivic[ii,1]=ii-(Nx-1) 
       else
          ivic[ii,1]=ii+1  
       end    
       # up (2)
       if j==Ny
          ivic[ii,2]=ii-Ny*(Nx-1)
       else
          ivic[ii,2]=ii+Nx
       end
       #left (3)
       if i==1
          ivic[ii,3]=ii+(Nx-1)
       else
        ivic[ii,3]=ii-1
       end 
       #down (4) 
       if j==1
          ivic[ii,4]=ii+(Ny-1)*(Nx)
       else
          ivic[ii,4]=ii-Nx
       end 

       ii=ii+1
 
    end
end
