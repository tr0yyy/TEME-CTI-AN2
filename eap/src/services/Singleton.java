package services;

import java.util.HashMap;
import java.util.Map;

public class Singleton {
    private static final Singleton instance = new Singleton();

    @SuppressWarnings("rawtypes")
    private Map <Class, Object> mapBuffer = new HashMap<Class,Object>();

    private Singleton(){}

    @SuppressWarnings("unchecked")
    public static <T> T getInstance(Class<T> classOf) throws InstantiationException, IllegalAccessException{
        if(!instance.mapBuffer.containsKey(classOf)){
            T object = classOf.newInstance();
            instance.mapBuffer.put(classOf, object);
        }
        return (T)instance.mapBuffer.get(classOf);
    }

}
