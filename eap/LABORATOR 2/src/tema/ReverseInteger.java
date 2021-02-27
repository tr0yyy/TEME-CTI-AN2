package tema;

public class ReverseInteger {
    public int reverse(int x)
    {
        int imagine = 0;
        while(x != 0)
        {
            int cifra = x % 10;
            x = x / 10;
            if(imagine * 10 / 10 != imagine)
                return 0;
            imagine = imagine * 10 + cifra;
        }
        return imagine;
    }
}
