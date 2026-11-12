package §_-1t9§
{
   import §_-Ahj§.§_-6XO§;
   import flash.display.Bitmap;
   import flash.utils.ByteArray;
   
   public class §_-96c§
   {
      public static const §_-Anq§:String = "wallPost";
      
      public static const §_-9IO§:String = "albumPost";
      
      public static const §_-4Ir§:String = "newsfeedPost";
      
      public static const §_-Aqf§:String = "messengerPost";
      
      public static const §_-6SG§:String = "requestPost";
      
      public static const §_-0B0§:String = "saveToFile";
      
      public var id:String = null;
      
      public var photo:Bitmap = null;
      
      public var photoUrl:String = "";
      
      public var uploadServer:String = null;
      
      public var type:String = null;
      
      public var §_-Bjy§:String = null;
      
      public var targetUserId:String = null;
      
      public var targetAlbumId:String = null;
      
      public var confirm:String = "";
      
      public var title:String = "";
      
      public var description:String = "";
      
      public var fileName:String = "image";
      
      public var links:§_-5tp§ = new §_-5tp§();
      
      public function §_-96c§()
      {
         super();
      }
      
      public function get §_-8B§() : ByteArray
      {
         return this.photo != null ? new §_-6XO§(100).encode(this.photo.bitmapData) : null;
      }
   }
}

