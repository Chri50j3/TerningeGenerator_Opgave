//NY NØDVENDIG VIDEN:
//1.) random
//2.) array's
//3.) funktioner med og uden returtype
//4.) funktioner med og uden input

//OPGAVE: lav arrays, variabler til at gemme terningkast og fordeling af terningekast
int kast;
int kastNr =1;
int[] kastAntal = new int [50];
int[] firkant = new int [6];
boolean tjek, center, Hup, Hned, Hc, Vup, Vned, Vc;

void setup() {
  size(600, 800);
  clear();
  textSize(14);
  text("TRYK på 'k' FOR AT KASTE", 50, 50);
  rectMode(CENTER);
}

void draw() {
  if(kastNr >= 40){kastNr = 40;}
  noStroke();
  fill(255);
  rect(100,150,100,100);
  terning(kast);
  fill(0);
  if(center == true){ellipse(100,150,25,25);}
  if(Hup == true){ellipse(130,120,25,25);}
  if(Hned == true){ellipse(130,180,25,25);}
  if(Hc == true){ellipse(130,150,25,25);}
  if(Vup == true){ellipse(70,120,25,25);}
  if(Vned == true){ellipse(70,180,25,25);}
  if(Vc == true){ellipse(70,150,25,25);}

  fill(255);
}

void keyPressed() {
  if (key != 'k' && key != 's')
    return;
  
  clear();
  text("TRYK på 'k' FOR AT KASTE / OG 's' FOR AT SLETTE", 50, 50);

  if (key == 'k') {
    //OPGAVE:  lav manglende funktion der laver 'terningekast'. 
    if(kastNr<=40){
      kast = lavTerningeKast(1, 7);
    }
    text("DIT KAST BLEV:" + kast, 50, 75);
    kastAntal[kastNr] = kast;
    kastNr += 1;
     tegnFordeling();
  }

  else if (key == 's') {
    //OPGAVE:  lav manglende funktion til at et terningekast
    sletkasse();
    fjernSidsteKast();

  }
if(kastNr<=40){  
  //OPGAVE: lav manglende funktion der kan udskrive alle terningekast som tekst ...
  udskrivKast();
}
}
int lavTerningeKast(int kastmin, int kastmax){
return int(random(kastmin,kastmax));
}

void tegnFordeling(){
  firkant[kastAntal[kastNr-1] - 1] += 1;
  for(int x=0; x<6; x++){
  if(firkant[x] < 0){
  firkant[x]=0;
  }
  rect(x*100+50,800,100,50*firkant[x]);
  fill(0);
  text("Antal "+(x+1),x*100+25,790);
  fill(255);
}
}
void sletkasse(){
  firkant[kastAntal[kastNr-1] -1] -= 1;
  tjek = true;
  for(int x=0; x<6; x++){
  if(firkant[x] < 0){
  firkant[x]=0;
  }
  rect(x*100+50,800,100,50*firkant[x]);
  fill(0);
  text("Antal "+(x+1),x*100+25,790);
  fill(255);
}
}

void fjernSidsteKast(){
  kastNr -= 1;
  if(kastNr <0){kastNr=0;}
  if(tjek == true){
  kastAntal[kastNr] = 0;
  tjek = false;
  }
}

void udskrivKast(){
textSize(14);
for(int i=0; i<40; i++){
  text("kast "+i+":"+kastAntal[i],500,i*15);
  if(kastAntal[i+1]<=0){i=50;}
}}

void terning(int tal){
if(tal == 1){ center = true; Hup = false; Hned = false; Hc = false; Vup = false; Vned = false; Vc = false;}
if(tal == 2){ center = false; Hup = true; Hned = false; Hc = false; Vup = false; Vned = true; Vc = false;}
if(tal == 3){ center = true; Hup = true; Hned = false; Hc = false; Vup = false; Vned = true; Vc = false;}
if(tal == 4){ center = false; Hup = true; Hned = true; Hc = false; Vup = true; Vned = true; Vc = false;}
if(tal == 5){ center = true; Hup = true; Hned = true; Hc = false; Vup = true; Vned = true; Vc = false;}
if(tal == 6){ center = false; Hup = true; Hned = true; Hc = true; Vup = true; Vned = true; Vc = true;}
}
