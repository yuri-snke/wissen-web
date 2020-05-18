package DTO;

public class ListaEventos {

    private static String[] AntiRepeat = new String[200];
    private static int count = 0;

    public static int getCount() {
        return count;
    }

    public static void incrementCount() {
        ListaEventos.count++;
    }

    public static String[] getAntiRepeat() {
        return AntiRepeat;
    }

    public static void setAntiRepeat(String AntiRepeat) {
        ListaEventos.AntiRepeat[count] = AntiRepeat;
    }

}