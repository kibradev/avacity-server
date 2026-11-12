package §_-3TY§
{
   import §_-05v§.§_-9me§;
   import §_-1iV§.§_-BkM§;
   import §_-1x4§.FacebookAdapter;
   import §_-2Wc§.§_-6Sf§;
   import §_-3An§.§_-5qp§;
   import §_-3Ck§.§_-2QE§;
   import §_-4jr§.§_-CZo§;
   import §_-5D4§.§_-4-h§;
   import §_-6-L§.§_-2Rb§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-6gH§;
   import §_-6BB§.§_-8BS§;
   import §_-7Hk§.§_-1U4§;
   import §_-7R4§.§_-20p§;
   import §_-7fa§.§_-0Rf§;
   import §_-8h6§.GameXPAdapter;
   import §_-AJi§.§_-5Vp§;
   import §_-CNP§.§_-0NB§;
   import §_-DG§.§_-3nQ§;
   import §_-Dy§.§_-6-0§;
   import §_-GM§.Context;
   import adept.config.Configuration;
   import adept.social.fotostrana.§_-4YB§;
   import adept.social.nk.§_-0vk§;
   import adept.social.odnoklassniki.§_-1FA§;
   import adept.social.vkontakteIFrame.§_-1MW§;
   import flash.display.MovieClip;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-5I8§
   {
      public static var §_-3YP§:String = "xorUserId";
      
      public function §_-5I8§()
      {
         super();
      }
      
      public static function §_-7BS§(param1:MovieClip) : §_-6gH§
      {
         var _loc2_:§_-2qC§ = null;
         var _loc3_:Object = {};
         var _loc4_:§_-4-h§ = new §_-4-h§();
         §_-BkM§.§_-0zv§(param1.stage);
         if(Config.production && param1.parent && param1.parent.root && Boolean(param1.parent.root.loaderInfo))
         {
            _loc4_ = new §_-4-h§(param1.parent.root.loaderInfo.parameters);
         }
         if(_loc4_.isEmpty())
         {
            _loc4_ = new §_-4-h§(Application.instance.flashVars);
         }
         _loc2_ = §_-1nf§(Config.socialNetwork,_loc3_,_loc4_,param1);
         Application.instance.flashVars = _loc4_.§_-523§();
         var _loc5_:§_-6gH§ = new §_-6gH§(_loc2_,_loc3_);
         _loc5_.serverTonnel = Context.§_-8dE§;
         return _loc5_;
      }
      
      private static function §_-1nf§(param1:String, param2:Object, param3:§_-4-h§, param4:MovieClip) : §_-2qC§
      {
         /*
          * 