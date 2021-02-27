package tema;

public class ReverseStringII {
    public  String reverseString(String s, int k)
    {
        if (s.length() == 1)
            return s;
        else
        {
            char[] s_array = s.toCharArray();
            for(int i = 0 ; i < s.length() ; i += 2 * k)
                reverseSubString(s_array, i, Math.min(i + k - 1, s.length() - 1));
            return new String(s_array);
        }
    }
    public void reverseSubString(char[] s, int left, int right)
    {
        while(left < right)
        {
            char aux = s[left];
            s[left] = s[right];
            s[right] = aux;
            left++;
            right--;
        }
    }
}
