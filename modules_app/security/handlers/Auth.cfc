/**
 * @ByJaime_Ramirez
 * 12/16/2019
 * Config rAuth Handler, session manager(login and logout)
 */
component extends = "handlers.BaseHandler"{

    property name="userService"	
             inject="UserService@security";
    property name="ormService"
             inject="entityService";
    /**
	* login
	*/
	function login( event, rc, prc ){
		var usr = populateModel( ormService.new( "User" ) );
		usr.setName( "jaime" );
		usr.setEmail( "q@gmail.com" );
		usr.setUsername( "jaime" );
		usr.setPassword( "1234") ;
   
	  prc.response
		  .setData( jwtAuth().attempt( usr.getUsername(), usr.getPassword() ) )
		  .addMessage( "Bearer token created and it expires in #jwtAuth().getSettings().jwt.expiration# minutes" );
	
	}	
    /**
     * Logout of our system
     */
    function logout( event, rc, prc ){//send Token in to Header
        jwtAuth().logout();
        prc.response.addMessage( "Successfully logged out, token invalidated" );
	}

}