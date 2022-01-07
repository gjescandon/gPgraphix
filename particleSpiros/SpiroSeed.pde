Table seedsTable;

void setupSpiroSeeds() {
  seedsTable = loadTable("SpirographSeeds.csv", "header");
}


/*

n1 / n2 > 1.0 :: inner  looper

n1 / n 2 < -0. 0 :: outer looper
n1/ n2 == - 1.0 :: oval *** # of pedals = 1 + integer ration
n1/n2 < -1.0 :: outer looper 

pedal size :: fat >>> thin >>> cross over >> fatt again similar to an inner looper

r1 / r2 symmetric about 0.0

r1 / r2 = 1.0 >> solid core
*/

class SpiroSeed {

  int n1, n2 , n3;
  float r1, r2, r3;
  
  SpiroSeed() {

    loadIntArr();
  }
  
  void loadIntArr() {
    int rint = floor(random(seedsTable.getRowCount()));
    
    TableRow seed = seedsTable.getRow(rint);
    //seed = seedsTable.getRow(9);
      int favored = 3;
    while (favored == 0) {
      //seed = seedsTable.getRow(floor(random(seedsTable.getRowCount())));
      seed = seedsTable.getRow(6);
      favored = seed.getInt("favored");
    }
    //int id = row.getInt("id");
    //String species = row.getString("species");
    //String name = row.getString("name");
    
    r1 = 1.0 * seed.getInt("r1");
    r2 = 1.0 * seed.getInt("r2");
    n1 = seed.getInt("n1");
    n2 = seed.getInt("n2"); 
  }
  
  float getR1() {
    return r1;
  }
  float getR2() {
    return r2;
  }
  float getN1() {
    return 1.0 * n1;
  }
  float getN2() {
    return 1.0 * n2;
  }
  
  void print() {
   println("" + r1 + " " + r2 + " " + n1 + " " + n2); 
  }
}
