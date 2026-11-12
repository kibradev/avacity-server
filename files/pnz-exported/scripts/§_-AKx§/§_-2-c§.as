package §_-AKx§
{
   import flash.events.Event;
   
   public class §_-2-c§ extends Event
   {
      public static const §_-AbI§:String = "dialogClosing";
      
      public static const §_-41T§:String = "dialogClosed";
      
      public static const §_-824§:String = "dialogReady";
      
      public static const §_-06V§:String = "dialogShowed";
      
      private var _dialog:§_-GN§;
      
      public function §_-2-c§(param1:String, param2:§_-GN§ = null)
      {
         super(param1,true,true);
         this._dialog = param2;
      }
      
      public function get §_-B66§() : §_-GN§
      {
         return this._dialog == null ? currentTarget as §_-GN§ : this._dialog;
      }
   }
}

