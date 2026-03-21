The Ising model, is a mathematical model of ferromagnetism in statistical mechanics.
The model consists of discrete variables that represent magnetic dipole moments of atomic "spins" that can be in one of two states (+1 or −1).
Interacting with each other and pushed to chaotic changes by the heat energy, system, however tends to obtain the lowest energy state.
Each frame programm uses combination of Monte-Carlo and Metropolis algorithmes to calculate the next state of model.
The model allows the identification of phase transitions as a simplified model of reality.

Execution:
  Model starts with a random state at above-transition temperature.
  In order to heat or freeze the model, click "w" and "s" buttons of the keybord respectively
  By defaul the model starts with a lattice of 250x250. However you can change this by changing values of size_x and size_y in player.pde
  If you want to start with a full positive or full negative lattice, change the third value in a constructor of an Ising model (line 13 player.pde):
      grid = new Ising(size_x,size_y,(byte)1,T,1); - all +
      grid = new Ising(size_x,size_y,(byte)-1,T,1); - all -
