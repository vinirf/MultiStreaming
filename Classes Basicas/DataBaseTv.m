//
//  DataBaseTv.m
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DataBaseTv.h"
#import "Tv.h"

@implementation DataBaseTv

+(DataBaseTv*)sharedManager{
    static DataBaseTv *unicoDataTv = nil;
    if(!unicoDataTv){
        unicoDataTv = [[super allocWithZone:nil]init];
    }
    return unicoDataTv;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaTv= [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(void)readJson{
   
    NSString *thePath=[[NSBundle mainBundle] pathForResource:@"listaTvs" ofType:@"json"];
     NSURL *url=[NSURL fileURLWithPath:thePath];
     NSData *returnData = [[NSData alloc] initWithContentsOfURL:url];
     NSError *error;
     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:returnData options:(kNilOptions) error:&error];
   //[[twit valueForKeyPath:@"entities.media.media_url"] objectAtIndex:0];
    
     for(int i=0;i<92;i++){
     
         NSString *title = [[json valueForKeyPath:@"item.title"] objectAtIndex:i];
         NSString *link = [[json valueForKeyPath:@"item.url"] objectAtIndex:i];
  
         Tv *tv1 = [[Tv alloc]init];
         [tv1 setTitulo:title];
         [tv1 setCaminho:link];
         
         [[self listaTv]addObject:tv1];
     }
}

-(NSMutableArray*)SerializarTvsSistema{

    /*NSString *thePath=[[NSBundle mainBundle] pathForResource:@"tv" ofType:@"json"];
    NSURL *url=[NSURL fileURLWithPath:thePath];
    NSData *returnData = [[NSData alloc] initWithContentsOfURL:url];
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:returnData options:(kNilOptions) error:&error];
    
    for(int i=0;i<[json count];i++){
        NSString *title = [json objectForKey:@"title"];
        //NSString *link =  [json objectForKey:@"url"];
    
    }
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"ptv" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];*/
    
    
    Tv *tv1 = [[Tv alloc]init];
    [tv1 setTitulo:@"Vevo TV"];
    [tv1 setCaminho:@"http://31.204.128.140:1935/live/master14/manifest(format=m3u8-aapl).m3u8"];
    
    Tv *tv2 = [[Tv alloc]init];
    [tv2 setTitulo:@"SBT"];
    [tv2 setCaminho:@"http://srv3.zoeweb.tv:1935/z133-live/stream/playlist.m3u8"];

    Tv *tv3 = [[Tv alloc]init];
    [tv3 setTitulo:@"中国凤凰"];
    [tv3 setCaminho:@"http://live.3gv.ifeng.com/live/hls/2500.m3u8"];
    
    Tv *tv4 = [[Tv alloc]init];
    [tv4 setTitulo:@"XXX"];
    [tv4 setCaminho:@"http://94.249.128.163/spi/eroxxhd_0_1/ratus42.m3u8"];
    
    Tv *tv5 = [[Tv alloc]init];
    [tv5 setTitulo:@"Clan"];
    [tv5 setCaminho:@"http://204.45.108.74:1935/ctv/_definst_/filmes/sat_total.m3u8"];
    
    Tv *tv6 = [[Tv alloc]init];
    [tv6 setTitulo:@"Naruto"];
    [tv6 setCaminho:@"http://204.45.108.26:1935/ctv/_definst_/naruto/.m3u8"];
    
    Tv *tv7 = [[Tv alloc]init];
    [tv7 setTitulo:@"Globo"];
    [tv7 setCaminho:@"http://199.115.117.93:1935/record/CH102_Big/GLOBO.m3u8"];

    
    Tv *tv18 = [[Tv alloc]init];
    [tv18 setTitulo:@"Heroes"];
    [tv18 setCaminho:@"http://204.45.108.26:1935/ctv/_definst_/heroes/hasbahca.m3u8"];
    
    Tv *tv19 = [[Tv alloc]init];
    [tv19 setTitulo:@"Extremadura TV"];
    [tv19 setCaminho:@"http://corporacionextremena-live.hls.adaptive.level3.net/hls-live/corporacionextremena-channel02/_definst_/live.m3u8"];
    
    Tv *tv20 = [[Tv alloc]init];
    [tv20 setTitulo:@"CWB tv"];
    [tv20 setCaminho:@"http://67.213.216.200/8066/8066/hasbahca.m3u8"];
    
    [[self listaTv]addObject:tv1];
    [[self listaTv]addObject:tv2];
    [[self listaTv]addObject:tv3];
    [[self listaTv]addObject:tv4];
    [[self listaTv]addObject:tv5];
    [[self listaTv]addObject:tv6];
    [[self listaTv]addObject:tv7];
    [[self listaTv]addObject:tv18];
    [[self listaTv]addObject:tv19];
    [[self listaTv]addObject:tv20];
    
    
    //Site para o WebService antigo quando funcionava
    //NSString* url = @"http://halilou-streamers.blogspot.com.br/2014/01/iptv-list-global-usa-suisse-belgium.html";
    //NSURL* query = [NSURL URLWithString:url]; //transforma em NSUrl
    //Codifica o codigo fonte do site para uma string
    //NSString* result = [NSString stringWithContentsOfURL:query encoding:NSUTF8StringEncoding error:nil];
    
    //LinK em cash
    //NSString* url = @"http://webcache.googleusercontent.com/search?q=cache:zLRIi-f6aKMJ:halilou-streamers.blogspot.com/2014/01/iptv-list-global-usa-suisse-belgium.html+&cd=1&hl=en&ct=clnk&gl=br";
    
    
    NSString *url=[[NSBundle mainBundle] pathForResource:@"linkTvEstatico" ofType:@"html"];
    
    NSString* result = [NSString stringWithContentsOfFile:url encoding:NSUTF8StringEncoding error:nil];
    
    // NSLog(@"%@",result);
    
    //Faz o recorte necessario do codigo
    NSString *string=result;
    NSRange searchFromRange = [string rangeOfString:@"post-body entry-content'>"];
    NSRange searchToRange = [string rangeOfString:@"<div style='clear:both;'>"];
    NSString *substring = [string substringWithRange:NSMakeRange(searchFromRange.location+searchFromRange.length, searchToRange.location-searchFromRange.location-searchFromRange.length)];
    
    //Substitui as tag <br> por espacos brancos, e por fim add o # a string final para logica dar certo
    NSString *semEspaco = [substring stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    NSString* stringFinal = [NSString stringWithFormat:@"%@%@", semEspaco, @"#"];
    
    //Controla o laco de repeticao
    NSRange continua =[stringFinal rangeOfString:@"#EXTINF:-1,"];

    //Joga todos os Canais em um Array
    NSMutableArray *todosCanais = [[NSMutableArray alloc]init];
    
    //Faz enquanto encontrar o ultimo #EXTINF:-1,
    while(continua.location != NSNotFound){
        
        Tv *t = [[Tv alloc]init];
        
        stringFinal = [stringFinal substringFromIndex:continua.location];
        stringFinal = [stringFinal substringFromIndex:[stringFinal rangeOfString:@","].location+1];
        
        t.titulo = [stringFinal substringToIndex:[stringFinal rangeOfString:@"http"].location-2];
       
        
        stringFinal = [stringFinal substringFromIndex:[stringFinal rangeOfString:@"http"].location];
        
        
        t.caminho = [stringFinal substringToIndex:[stringFinal rangeOfString:@"#"].location-2];

        [todosCanais addObject:t];
        
        //pega o proximo #EXTINF:-1, até sair do While
        continua = [stringFinal rangeOfString:@"#EXTINF:-1,"];
        
    }
    
    //Joga na Lista Somente Canais Brasileiros
    [self validaCanaisBrasil:todosCanais];
    
    
    [self readJson];
    
    
    return [self listaTv];
    
}

//Joga na listaPrincipal somente os canais com incidencia no Brasil
-(void)validaCanaisBrasil:(NSMutableArray*)listaTodosCanais {
    for(int i=0;i<listaTodosCanais.count;i++){
        Tv *aux = listaTodosCanais[i];
        if([[aux titulo] rangeOfString:@"BRASIL"].location == NSNotFound){
            //NSLog(@"ch = %@",aux.titulo);
        }else{
            NSString *tiraBrasilString = [[aux titulo] stringByReplacingOccurrencesOfString:@"BRASIL" withString:@""];
            NSString *tiraPontoString = [tiraBrasilString stringByReplacingOccurrencesOfString:@":" withString:@""];
            [aux setTitulo:tiraPontoString];
            [[self listaTv]addObject:aux];
        }
    }
    
    //NSLog(@"v= %lu",(unsigned long)self.listaTv.count);
}

-(NSArray*)allItems{
    return [self listaTv];
}




@end
