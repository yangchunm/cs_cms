package org.kelab.common;

import org.kelab.index.IndexController;
import org.kelab.login.LoginController;

import com.jfinal.config.Routes;

/**
 * 前台路由
 */
public class FrontRoutes extends Routes {

	public void config() {
		//addInterceptor(new LoginSessionInterceptor());
		setBaseViewPath("/_view");
		
		add("/", IndexController.class, "/index");
		add("/login", LoginController.class);
		//add("/share", ShareController.class);
		//add("/feedback", FeedbackController.class);
		//add("/project", ProjectController.class);
		
		//add("/reg", RegController.class);
		//add("/download", DownloadController.class);
        //add("/like", LikeController.class);
		//add("/doc", DocumentController.class, "/document");

		// 个人空间：由于共用了相同的拦截器，后续可将其拆分到 MyRoutes 中去，可减少拦截器配置冗余
		//add("/my", NewsFeedController.class, "/my/newsfeed");
		//add("/my/project", MyProjectController.class);
		//add("/my/share", MyShareController.class);
		//add("/my/feedback", MyFeedbackController.class);
		//add("/my/setting", MySettingController.class);
		//add("/my/friend", MyFriendController.class);
        //add("/my/message", MessageController.class);
        //add("/my/favorite", FavoriteController.class);

		// 用户空间
		//add("/user", UserNewsFeedController.class, "/user/newsfeed");
		//add("/user/share", UserShareController.class);
		//add("/user/feedback", UserFeedbackController.class);
		//add("/user/project", UserProjectController.class);
        //add("/user/friend", UserFriendController.class);*/
	}
}
