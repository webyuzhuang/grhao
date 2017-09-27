import com.fz.mapper.UserDoMapper;
import com.fz.model.UserDo;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by zhuang on 2017-09-23.
 */
public class Demoo {

    @Test
    public void aa() {
        ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        UserDoMapper i=ctx.getBean(UserDoMapper.class);
        List<UserDo> list=i.selectAll();
        for (UserDo u:list){
            System.out.println(u.getName());
        }
    }
}
