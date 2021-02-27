package tema;

public class Palindrom {
    public boolean IsPalindrom(int x)
    {
        String x_string = String.valueOf(x);
        int left = 0, right = x_string.length() - 1;
        char[] x_char = x_string.toCharArray();
        while (left < right)
        {
            if(x_char[left] != x_char[right])
                return false;
            left++;
            right--;
        }
        return true;
    }
}
