public class DogLoop {
    public static void main(String[] args) {
        DOG smallDog = new DOG(5);
        DOG mediumDog = new DOG(25);
        DOG hugeDog = new DOG(150);

        DOG[] manyDogs = new DOG[4];
        manyDogs[0] = smallDog;
        manyDogs[1] = hugeDog;
        manyDogs[2] = new DOG(130);
        manyDogs[3] = new DOG(100);

        int i = 0;
        while (i < manyDogs.length) {
            DOG.maxDog(manyDogs[i], mediumDog).dognoise();
            i = i + 1;
        }
    }

    /* CLASS DOG, it's an embeded class */
    /* NOTICE: Here we use "static" to avoid this error: 
    non-static variable this cannot be referenced from a static context */
    public static class DOG {
        public int weight;

        public DOG(int w) {
            weight = w;
        }
        /* Method dognoise*/
        public void dognoise() {
            if (weight < 10) {
                System.out.println("yip!");
            } else if (weight < 30) {
                System.out.println("wooof!");
            } else {
                System.out.println("bark!");
            }
        }
        /* Method maxDog*/
        public static DOG maxDog(DOG d1, DOG d2) {
            if (d1.weight > d2.weight) {
                return d1;
            }
            return d2;
        }
    }
}
