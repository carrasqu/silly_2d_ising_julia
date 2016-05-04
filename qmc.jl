
Nx=20        # size of lattice along space  
Ny=20        # size of lattice along time direction 
betar=0.05 #log(1+sqrt(2))/2     # temperature  
spin=Int32[] # spin configuration
ivic=Int32[] #geometry of the lattice with PBC
#g=1          # field strength

msteps=600   # steps per bin
nther=30     # thermalization bins
nrun=25     # thermalization run
seed=1010101 # starts the random number generator

#reading input file

(g,Nx,Ny,betar)=readdlm("a.dat")
Ny=convert(Int64,Ny)
Nx=convert(Int64,Nx)

include("lattice.jl")
include("initial.jl")
include("bin.jl")



# thermalization
for i = 1:nther
   (mea,E,spin)=runbin(msteps,E,spin,betac,gam,mea)
   println(100*i/nther)  
end 

println("Thermalization ready...")

# run
for i = 1:nrun
   
   (mea,E,spin)=runbin(msteps,E,spin,betac,gam,mea)
   (Vm,Vm2)=accmeasure(Vm,Vm2,mea,i,spin) 
   #include("writef.jl") 
end
 



