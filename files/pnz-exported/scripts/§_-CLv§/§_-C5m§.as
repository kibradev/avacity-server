package §_-CLv§
{
   import §_-5qo§.FacebookAdapter;
   import §_-5qo§.GameXPAdapter;
   import §_-5qo§.§_-0ns§;
   import §_-5qo§.§_-1FA§;
   import §_-5qo§.§_-1I-§;
   import §_-5qo§.§_-1U4§;
   import §_-5qo§.§_-3Ai§;
   import §_-5qo§.§_-3nQ§;
   import §_-5qo§.§_-4YB§;
   import §_-5qo§.§_-5i0§;
   import §_-5qo§.§_-6-0§;
   import §_-5qo§.§_-7UG§;
   import §_-5qo§.§_-9me§;
   import §_-5qo§.§_-9sO§;
   
   public class §_-C5m§
   {
      private var §_-1uV§:§_-5i0§;
      
      public function §_-C5m§()
      {
         super();
      }
      
      public function configure(param1:§_-BDF§, param2:Object) : void
      {
         var _loc3_:String = param1.social;
         if(_loc3_ == §_-AZb§.§_-9kU§)
         {
            this.§_-1uV§ = new §_-1I-§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-Uu§)
         {
            this.§_-1uV§ = new §_-1FA§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-9kK§)
         {
            this.§_-1uV§ = new §_-0ns§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-614§)
         {
            this.§_-1uV§ = new §_-4YB§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-BOa§)
         {
            this.§_-1uV§ = new FacebookAdapter(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-8Lg§)
         {
            this.§_-1uV§ = new §_-6-0§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-Boi§)
         {
            this.§_-1uV§ = new §_-7UG§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-3YZ§)
         {
            this.§_-1uV§ = new §_-3nQ§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-BTG§)
         {
            this.§_-1uV§ = new §_-1U4§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-8Jg§)
         {
            this.§_-1uV§ = new §_-9me§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.TGC)
         {
            this.§_-1uV§ = new §_-9sO§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-7SL§)
         {
            this.§_-1uV§ = new §_-9sO§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-8wY§)
         {
            this.§_-1uV§ = new §_-9sO§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-AhK§)
         {
            this.§_-1uV§ = new §_-9sO§(param1,param2);
         }
         else if(_loc3_ == §_-AZb§.§_-Cs§)
         {
            this.§_-1uV§ = new GameXPAdapter(param1,param2);
         }
         else
         {
            if(_loc3_ != §_-AZb§.§_-4Kk§)
            {
               throw new ArgumentError("There is no AuthAdapter for social: " + _loc3_);
            }
            this.§_-1uV§ = new §_-3Ai§(param1,param2);
         }
      }
      
      public function updateFlashVars(param1:Object) : void
      {
         this.§_-1uV§.updateFlashVars(param1);
      }
      
      public function auth(param1:Function, param2:Function = null) : void
      {
         this.§_-1uV§.auth(param1,param2);
      }
      
      public function get adapter() : §_-5i0§
      {
         return this.§_-1uV§;
      }
      
      public function set adapter(param1:§_-5i0§) : void
      {
         this.§_-1uV§ = §_-3zt§.§_-7cy§(param1,"adapter") as §_-5i0§;
      }
      
      public function get active() : Boolean
      {
         return this.§_-1uV§.active;
      }
   }
}

