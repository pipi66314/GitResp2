package web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 登录验证的过滤器
 */

@WebFilter("/*")
public class LoginFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        // 0.强转
        HttpServletRequest request = (HttpServletRequest) req;

        // 1.获取资源请求路径
        String uri = request.getRequestURI();
        System.out.println(uri);
        // 2.判断是否包含登录相关资源路径,要注意排除掉 css/js/图片/验证码等资源
        if (uri.contains("login.jsp") || uri.contains("/loginServlet")
                || uri.contains("/css/") || uri.contains("/js/")
                || uri.contains("/fonts/") || uri.contains("/checkServlet")) {
            // 包含,用户就是想登录,放行
            chain.doFilter(req, resp);
        } else {
            // 不包含,需要验证用户是否登录
            // 3.从获取session中获取user
            Object admin = request.getSession().getAttribute("admin");
            System.out.println(admin);
            if (admin != null) {
                chain.doFilter(req, resp);

            } else {
                // 没有登录,跳转到登录页面
                request.setAttribute("login_msg", "您尚未登录,请先登录");
                request.getRequestDispatcher("/login.jsp").forward(request, resp);
            }
        }

    }

    public void destroy() {
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
