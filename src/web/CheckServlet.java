package web;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkServlet")
public class CheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 服务器通知浏览器不要缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");

        int width = 100;
        int height = 50;
        StringBuffer sb = new StringBuffer();

        // 1.创建图片对象
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

        // 2.美化图片
        // 2.1 填充背景色
        Graphics g = image.getGraphics();  //画笔对象
        g.setColor(Color.GRAY);            // 设置画笔颜色
        g.fillRect(0, 0, width, height);

        // 2.2 画边框
        g.setColor(Color.BLUE);
        g.drawRect(0, 0, width - 1, height - 1);

        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        // 生成随机角标
        Random ran = new Random();

        for (int i = 1; i <= 4; i++) {
            int index = ran.nextInt(str.length());
            // 获取随机字符
            char ch = str.charAt(index);
            sb.append(ch);
            request.getSession().setAttribute("CHECKCODE_SERVER",sb.toString());
            // 2.3写验证码
            g.setColor(Color.yellow);
            g.setFont(new Font("黑体", Font.BOLD, 24));

            g.drawString(ch + "", width / 5 * i, height / 2);
        }

        // 2.4画干扰线
        g.setColor(Color.green);
        // 随机生成坐标点
        for (int i = 0; i < 8; i++) {
            int x1 = ran.nextInt(width);
            int x2 = ran.nextInt(width);

            int y1 = ran.nextInt(height);
            int y2 = ran.nextInt(height);

            g.drawLine(x1,y1,x2,y2);
        }

        // 3.将图片输出到页面展示
        ImageIO.write(image,"jpg",response.getOutputStream());
        System.out.println("验证码:" + sb.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
