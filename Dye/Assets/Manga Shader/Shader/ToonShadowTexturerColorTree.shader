S h a d e r   " C u s t o m / T o o n S h a d o w T e x t u r e r C o l o r T r e e "   { 
 
 	   P r o p e r t i e s   { 
 	 	 _ M a i n T e x   ( " T e x t u r e " ,   2 D )   =   " w h i t e "   { } 
 	 	 _ S h a d o w T e x   ( " S h a d o w   T e x t u r e " ,   2 D )   =   " w h i t e "   { } 
 	 	 _ C o l o r   ( " C o l o r " ,   c o l o r )   =   ( 1 , 1 , 1 , 1 ) 
 	 	 _ C o l o r _ S P C   ( " C o l o r   S p e c u l a r " ,   c o l o r )   =   ( 1 , 1 , 1 , 1 ) 
 	 	 _ C o l o r _ S h a d o w   ( " C o l o r   S h a d o w " ,   c o l o r )   =   ( 1 , 1 , 1 , 1 ) 
 	 	 _ D i f f u s e T h r e s h o l d   ( " T h r e s h o l d   f o r   D i f f u s e   C o l o r s " ,   R a n g e ( 0 , 1 ) ) =   0 . 3 
 	 	 _ D i f f u s e S h a d o w   ( " T h r e s h o l d   f o r   S h a d o w   C o l o r s " ,   R a n g e ( 0 , 1 ) ) =   0 . 1 
 	 	 _ I n t e n s i t y   ( " I n t e n s i t y   C o l o r " ,   R a n g e ( 0 , 1 ) ) =   0 . 1   
 	 } 
 	 S u b S h a d e r   { 
 	 	 T a g s   {   " R e n d e r T y p e "   =   " O p a q u e "   } 
 	 	 C G P R O G R A M 
 
 	 	 # p r a g m a   s u r f a c e   s u r f   T o o n 
   
 	 	 s t r u c t   I n p u t   { 
 	 	 	 f l o a t 2   u v _ M a i n T e x ; 
 	 	 } ; 
 
 	 	 u n i f o r m   h a l f 4   _ C o l o r ; 
 	 	 u n i f o r m   h a l f 4   _ C o l o r _ S h a d o w ; 
 	 	 u n i f o r m   h a l f 4   _ C o l o r _ S P C ; 
 	 	 u n i f o r m   f l o a t   _ D i f f u s e T h r e s h o l d ; 
 	 	 u n i f o r m   f l o a t   _ D i f f u s e S h a d o w ; 
 	 	 u n i f o r m   f l o a t   _ I n t e n s i t y ; 
 	 	 s a m p l e r 2 D   _ M a i n T e x ; 
 	 	 s a m p l e r 2 D   _ S h a d o w T e x ; 
 	 	 f l o a t 2   u v _ M a i n T e x A U X ; 
 
 
 	 	 v o i d   s u r f   ( I n p u t   I N ,   i n o u t   S u r f a c e O u t p u t   o )   { 
 	 	         
 	 	 	 o . A l b e d o   =   ( t e x 2 D   ( _ M a i n T e x ,   I N . u v _ M a i n T e x ) . r g b   *     _ I n t e n s i t y   )   *   _ C o l o r ; 
 	 	 	 u v _ M a i n T e x A U X   =   I N . u v _ M a i n T e x ; 
 	 	 } 
 
 
 	 	 f i x e d 4   L i g h t i n g T o o n   ( S u r f a c e O u t p u t   s ,   f i x e d 3   l i g h t D i r ,   f i x e d   a t t e n ) 
 	 	 { 
 	 	 	 h a l f   N d o t L   =   d o t ( s . N o r m a l ,   l i g h t D i r ) ;   
 
 
 	 	 	 / / N d o t L   =   t e x 2 D ( _ R a m p T e x ,   f i x e d 2 ( N d o t L ,   0 . 5 ) ) ; 
 
 	 	 	 i f ( N d o t L   <   _ D i f f u s e T h r e s h o l d ) { 
 	 	 	 	 	 
 	 	 	 	 	 N d o t L   =   t e x 2 D   ( _ S h a d o w T e x ,   u v _ M a i n T e x A U X )   *   _ C o l o r _ S h a d o w ; 
 	 	 	   	 
 	 	 	 
 	 	 	 } e l s e { 
 	 	 	         i f ( N d o t L   <   _ D i f f u s e S h a d o w ) { 
 
 	 	 	 	 	 N d o t L   =   t e x 2 D   ( _ S h a d o w T e x ,   u v _ M a i n T e x A U X )   *   _ C o l o r ; 
 
 	 	 	 	 } e l s e { 
 
 	 	 	 	 	 N d o t L   =   _ C o l o r _ S P C ; 
 	 	 	 	 } 
 	 	 	 } 
 
   
 	 	 	 f i x e d 4   c ; 
 	 	 	 c . r g b   =   s . A l b e d o   *   _ L i g h t C o l o r 0 . r g b   *   N d o t L   *   2   *   _ C o l o r _ S P C ; 
 	 	 	 c . a   =   s . A l p h a ; 
   
 	 	 	 r e t u r n   c ; 
 	 	 } 
   
 	 	 E N D C G 
 	 }   
 	 F a l l b a c k   " D i f f u s e " 
 } 
 