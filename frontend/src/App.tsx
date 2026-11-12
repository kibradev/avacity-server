import { FormEvent, useEffect, useMemo, useState } from "react"
import { ArrowRight, Check, ChevronRight, CircleUserRound, Coins, Gamepad2, LogOut, Menu, Moon, Play, Search, Sun, Users, X, Zap } from "lucide-react"
import { Button } from "./components/ui/button"
import { Input } from "./components/ui/input"
import { Avatar, AvatarFallback } from "./components/ui/avatar"
import { cn } from "./lib/utils"

type Player = { id:string; name:string; email:string; level:number; exp:number; gold:number; silver:number; energy:number; honor:number; rating:number; online:boolean; lastSeen:number }
type Friend = { id:string; name:string; level:number; online:boolean; lastSeen:number; relation:number }

const initials = (name:string) => name.split(/\s+/).map(x => x[0]).join("").slice(0,2).toUpperCase()
const relativeTime = (timestamp:number) => {
  if (!timestamp) return "Uzun zaman önce"
  const seconds = Math.max(0, Math.floor(Date.now()/1000)-timestamp)
  if (seconds < 60) return "Şimdi"
  if (seconds < 3600) return `${Math.floor(seconds/60)} dk önce`
  if (seconds < 86400) return `${Math.floor(seconds/3600)} sa önce`
  return `${Math.floor(seconds/86400)} gün önce`
}

function GoogleMark(){ return <svg viewBox="0 0 24 24" className="size-4" aria-hidden><path fill="currentColor" d="M21.35 12.23c0-.71-.06-1.4-.18-2.07H12v3.91h5.24a4.48 4.48 0 0 1-1.94 2.94v2.54h3.14c1.84-1.69 2.91-4.18 2.91-7.32Z"/><path fill="currentColor" opacity=".78" d="M12 21.75c2.63 0 4.83-.87 6.44-2.36l-3.14-2.54c-.87.58-1.98.93-3.3.93-2.53 0-4.68-1.71-5.45-4.01H3.31v2.62A9.75 9.75 0 0 0 12 21.75Z"/><path fill="currentColor" opacity=".55" d="M6.55 13.77A5.86 5.86 0 0 1 6.24 12c0-.61.11-1.21.31-1.77V7.61H3.31A9.75 9.75 0 0 0 2.25 12c0 1.57.38 3.06 1.06 4.39l3.24-2.62Z"/><path fill="currentColor" opacity=".35" d="M12 6.22c1.43 0 2.72.49 3.73 1.46l2.79-2.8C16.83 3.31 14.63 2.25 12 2.25a9.75 9.75 0 0 0-8.69 5.36l3.24 2.62c.77-2.3 2.92-4.01 5.45-4.01Z"/></svg> }
function DiscordMark(){ return <svg viewBox="0 0 24 24" className="size-4" aria-hidden><path fill="currentColor" d="M19.5 5.34A16.3 16.3 0 0 0 15.44 4l-.5 1.02a15.2 15.2 0 0 0-5.87 0L8.56 4A16.5 16.5 0 0 0 4.5 5.35C1.93 9.18 1.24 12.9 1.59 16.57a16.7 16.7 0 0 0 4.98 2.51l1.22-1.65a10.7 10.7 0 0 1-1.92-.92l.47-.37c3.7 1.71 7.72 1.71 11.38 0l.48.37c-.62.36-1.27.67-1.93.92l1.21 1.65a16.6 16.6 0 0 0 4.98-2.51c.41-4.25-.7-7.93-2.96-11.23ZM8.52 14.32c-1.11 0-2.02-1.02-2.02-2.27s.89-2.27 2.02-2.27c1.14 0 2.04 1.03 2.02 2.27 0 1.25-.89 2.27-2.02 2.27Zm6.96 0c-1.11 0-2.02-1.02-2.02-2.27s.89-2.27 2.02-2.27c1.14 0 2.04 1.03 2.02 2.27 0 1.25-.88 2.27-2.02 2.27Z"/></svg> }

function ThemeToggle({dark,setDark}:{dark:boolean;setDark:(v:boolean)=>void}){ return <Button variant="ghost" size="icon" onClick={()=>setDark(!dark)} aria-label="Temayı değiştir">{dark?<Sun className="size-4"/>:<Moon className="size-4"/>}</Button> }

function AuthPanel({open,onClose,onSuccess,googleEnabled,discordEnabled,authError}:{open:boolean;onClose:()=>void;onSuccess:()=>void;googleEnabled:boolean;discordEnabled:boolean;authError:string}){
  const [register,setRegister]=useState(false), [loading,setLoading]=useState(false), [error,setError]=useState("")
  const [mounted,setMounted]=useState(open), [visible,setVisible]=useState(false)
  useEffect(()=>{
    let frame=0, timer=0
    if(open){
      setMounted(true)
      frame=requestAnimationFrame(()=>setVisible(true))
    }else{
      setVisible(false)
      timer=window.setTimeout(()=>setMounted(false),240)
    }
    return()=>{cancelAnimationFrame(frame);clearTimeout(timer)}
  },[open])
  async function submit(e:FormEvent<HTMLFormElement>){
    e.preventDefault(); setLoading(true); setError("")
    const data=Object.fromEntries(new FormData(e.currentTarget))
    const res=await fetch(`/api/auth/${register?"register":"login"}`,{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(data)})
    const body=await res.json().catch(()=>({error:"Bir şeyler ters gitti."})); setLoading(false)
    if(!res.ok){setError(body.error);return} onSuccess(); onClose()
  }
  if(!mounted)return null
  return <div className={cn("fixed inset-0 z-50 flex items-center justify-center bg-background/75 p-4 backdrop-blur-md transition-opacity duration-300",visible?"opacity-100":"opacity-0")} role="dialog" aria-modal>
    <button className="absolute inset-0" onClick={onClose} aria-label="Kapat"/>
    <section className={cn("auth-surface relative z-10 w-full max-w-md bg-background p-8 transition-[opacity,transform] duration-300 ease-[cubic-bezier(.22,1,.36,1)] sm:p-10",visible?"translate-y-0 scale-100 opacity-100":"translate-y-3 scale-[.985] opacity-0")}>
      <Button variant="ghost" size="icon" className="absolute right-3 top-3" onClick={onClose} aria-label="Kapat"><X className="size-4"/></Button>
      <h1 className="pr-12 font-display text-3xl font-semibold">{register?"Kayıt ol":"Giriş yap"}</h1>
      <div className="mt-8 grid grid-cols-2 gap-3">
        {googleEnabled?<a href="/auth/google" className="flex h-12 items-center justify-center gap-2 rounded-lg border border-border text-sm font-medium transition-colors duration-200 hover:bg-muted"><GoogleMark/>Google</a>:<button type="button" disabled className="flex h-12 items-center justify-center gap-2 rounded-lg border border-border text-sm font-medium opacity-35"><GoogleMark/>Google</button>}
        {discordEnabled?<a href="/auth/discord" className="flex h-12 items-center justify-center gap-2 rounded-lg border border-border text-sm font-medium transition-colors duration-200 hover:bg-muted"><DiscordMark/>Discord</a>:<button type="button" disabled className="flex h-12 items-center justify-center gap-2 rounded-lg border border-border text-sm font-medium opacity-35"><DiscordMark/>Discord</button>}
      </div>
      {authError&&<p className="mt-3 text-sm text-muted-foreground">{authError}</p>}
      <div className="my-7 flex items-center gap-4 text-xs text-muted-foreground"><span className="h-px flex-1 bg-border"/>veya<span className="h-px flex-1 bg-border"/></div>
      <form onSubmit={submit} className="space-y-5">
        {register&&<label className="block text-xs font-medium text-muted-foreground">Oyuncu adı<Input name="name" required maxLength={24}/></label>}
        <label className="block text-xs font-medium text-muted-foreground">{register?"E-posta":"E-posta veya oyuncu ID"}<Input name="email" type={register?"email":"text"} required autoComplete="email"/></label>
        <label className="block text-xs font-medium text-muted-foreground">Şifre<Input name="password" type="password" required minLength={8} autoComplete={register?"new-password":"current-password"}/></label>
        {error&&<p className="text-sm text-foreground" role="alert">{error}</p>}
        <Button className="w-full" disabled={loading}>{loading?"Lütfen bekle…":register?"Kayıt ol":"Giriş yap"}</Button>
      </form>
      <button onClick={()=>{setRegister(!register);setError("")}} className="mt-7 w-full text-center text-sm text-muted-foreground transition-colors hover:text-foreground">{register?"Giriş yap":"Kayıt ol"}</button>
    </section>
  </div>
}

function Logo(){return <a href="#" className="font-display text-xl tracking-[-.035em]" aria-label="AvaCity Next ana sayfa"><span className="font-semibold">AvaCity</span><span className="ml-1.5 font-normal text-muted-foreground">Next</span></a>}

function Landing({user,onAuth,onEnter,dark,setDark}:{user:Player|null;onAuth:()=>void;onEnter:()=>void;dark:boolean;setDark:(v:boolean)=>void}){
 return <div>
  <header className="fixed inset-x-0 top-0 z-40 border-b border-border bg-background/80 backdrop-blur-xl"><nav className="mx-auto flex h-20 max-w-[1440px] items-center justify-between px-6 lg:px-12"><Logo/><div className="flex items-center gap-2 sm:gap-4"><a href="#rules" className="text-sm text-muted-foreground transition-colors hover:text-foreground">Kurallar</a><ThemeToggle dark={dark} setDark={setDark}/><Button size="sm" onClick={user?onEnter:onAuth}>{user?"Oyuna dön":"Giriş"}</Button></div></nav></header>
  <main>
   <section className="flex min-h-[78vh] items-end border-b border-border px-6 pb-20 pt-36 lg:px-12 lg:pb-28"><div className="mx-auto w-full max-w-[1440px]"><h1 className="font-display text-[clamp(4.5rem,12vw,11rem)] leading-[.82] tracking-[-.075em]"><span className="font-semibold">AvaCity</span><span className="ml-[.08em] font-normal text-muted-foreground">Next</span></h1><div className="mt-12"><Button onClick={user?onEnter:onAuth}><Play className="size-4 fill-current"/>{user?"Oyuna dön":"Oyuna gir"}</Button></div></div></section>
   <section className="px-6 py-20 lg:px-12"><div className="mx-auto max-w-[1440px]"><p className="mb-8 text-sm font-medium">Oyunda</p><div className="grid gap-px overflow-hidden rounded-xl border border-border bg-border sm:grid-cols-2 lg:grid-cols-4"><Feature icon={<CircleUserRound/>} title="Karakter" text="Karakterini ve stilini özelleştir."/><Feature icon={<Users/>} title="Arkadaşlar" text="Arkadaşlarınla gerçek zamanlı buluş."/><Feature icon={<Gamepad2/>} title="Mekânlar" text="Evleri ve sosyal alanları keşfet."/><Feature icon={<Zap/>} title="Etkinlikler" text="Görevlere ve etkinliklere katıl."/></div></div></section>
   <section id="rules" className="scroll-mt-20 border-t border-border px-6 py-20 lg:px-12"><div className="mx-auto grid max-w-[1440px] gap-10 md:grid-cols-[1fr_2fr]"><h2 className="font-display text-3xl font-semibold">Kurallar</h2><ol className="divide-y divide-border border-y border-border text-sm"><Rule number="01" text="Diğer oyunculara saygılı ol."/><Rule number="02" text="Hile, açık kullanımı ve hesap paylaşımı yapma."/><Rule number="03" text="Spam, taciz ve uygunsuz içerik paylaşma."/><Rule number="04" text="Kişisel bilgilerini ve hesap şifreni paylaşma."/></ol></div></section>
  </main><footer className="border-t border-border px-6 py-8 lg:px-12"><div className="mx-auto max-w-[1440px] text-xs text-muted-foreground">© 2026 AvaCity Next</div></footer>
 </div>
}

function Feature({icon,title,text}:{icon:React.ReactNode;title:string;text:string}){return <div className="bg-background p-8"><div className="mb-7 [&>svg]:size-5">{icon}</div><h3 className="font-display text-lg font-semibold">{title}</h3><p className="mt-2 text-sm leading-relaxed text-muted-foreground">{text}</p></div>}
function Rule({number,text}:{number:string;text:string}){return <li className="grid grid-cols-[3rem_1fr] gap-4 py-5"><span className="text-muted-foreground">{number}</span><span>{text}</span></li>}

function GameView({updateTime,onClose}:{updateTime:string;onClose:()=>void}){
 const [ready,setReady]=useState(false)
 useEffect(()=>{document.body.style.overflow="hidden";const launch=()=>{const swf=(window as unknown as {swfobject?:{embedSWF:(...a:unknown[])=>void}}).swfobject;if(!swf)return;const vars={config:`/appconfig.xml?t=${updateTime}`,versions:`/files/versions.json?${updateTime}`,appSwf:`/files/pnz-city.swf?${updateTime}`};const params={flashvars:Object.entries(vars).map(([k,v])=>`${k}=${encodeURIComponent(v)}`).join("&"),allowfullscreen:"true",allowscriptaccess:"always",allowFullScreenInteractive:"true",allownetworking:"all",scale:"exactfit",wmode:"opaque"};swf.embedSWF(`/files/pnz-city-container.swf?${updateTime}`,"flashContent","100%","100%","10",null,null,params,{name:"flashContent",style:"width:100%;height:100%;display:block;"});setReady(true)};if((window as unknown as {swfobject?:unknown}).swfobject)launch();else{const s=document.createElement("script");s.src="/files/swfobject.js";s.onload=launch;document.head.appendChild(s)} return ()=>{document.body.style.overflow=""}},[updateTime])
 return <div className="fixed inset-0 z-50 flex flex-col bg-black text-white overflow-hidden w-full h-full"><div className="flex h-12 shrink-0 items-center justify-between border-b border-white/10 px-5 bg-neutral-950"><Logo/><div className="flex items-center gap-3 text-xs text-white/50">{ready?"Oyun başlatıldı":"Dünya yükleniyor…"}<Button variant="ghost" size="icon" className="text-white hover:bg-white/10" onClick={onClose}><X className="size-4"/></Button></div></div><div className="relative flex-1 w-full min-h-0 overflow-hidden bg-black flex items-center justify-center"><div id="flashContent" className="w-full h-full" style={{width:"100%",height:"100%"}}/></div></div>
}

function Dashboard({user,updateTime,onBack,onLogout,dark,setDark}:{user:Player;updateTime:string;onBack:()=>void;onLogout:()=>void;dark:boolean;setDark:(v:boolean)=>void}){
 const [friends,setFriends]=useState<Friend[]>([]),[query,setQuery]=useState(""),[playing,setPlaying]=useState(false)
 useEffect(()=>{let active=true;const load=()=>fetch("/api/friends").then(r=>r.json()).then(d=>active&&setFriends(d.friends||[]));load();const timer=setInterval(load,15000);return()=>{active=false;clearInterval(timer)}},[])
 const visible=useMemo(()=>friends.filter(f=>f.name.toLowerCase().includes(query.toLowerCase())),[friends,query]); const online=friends.filter(f=>f.online).length
 return <div className="min-h-screen"><header className="border-b border-border"><div className="mx-auto flex h-20 max-w-[1440px] items-center justify-between px-6 lg:px-12"><button onClick={onBack}><Logo/></button><div className="flex items-center gap-2"><ThemeToggle dark={dark} setDark={setDark}/><Button variant="ghost" size="sm" onClick={onLogout}><LogOut className="size-4"/>Çıkış</Button></div></div></header>
 <main className="mx-auto max-w-[1440px] px-6 py-10 lg:px-12"><div className="grid gap-14 lg:grid-cols-[1fr_390px]"><section><p className="eyebrow">Oyuncu merkezi / #{user.id}</p><div className="mt-5 flex flex-wrap items-end justify-between gap-6 border-b border-border pb-10"><div><h1 className="font-display text-5xl font-semibold md:text-7xl">Merhaba, {user.name}.</h1><p className="mt-4 text-muted-foreground">Hesap özeti ve oyun bilgilerin.</p></div><Button className="h-13 px-8" onClick={()=>setPlaying(true)}><Play className="size-4 fill-current"/>Oyunu başlat</Button></div>
 <div className="grid grid-cols-2 border-b border-border md:grid-cols-4"><Stat label="Seviye" value={user.level}/><Stat label="Altın" value={user.gold} icon={<Coins/>}/><Stat label="Enerji" value={user.energy} icon={<Zap/>}/><Stat label="Onur" value={user.honor}/></div>
 <div className="py-12"><div className="relative overflow-hidden rounded-xl bg-foreground p-10 text-background md:p-14"><div className="relative z-10 max-w-xl"><p className="text-xs uppercase tracking-[.2em] opacity-50">Hızlı erişim</p><h2 className="mt-5 font-display text-4xl font-semibold md:text-5xl">Oyuna dön</h2><p className="mt-5 opacity-60">Son ilerlemen kaydedildi.</p><Button className="mt-8 bg-background text-foreground hover:bg-background/80" onClick={()=>setPlaying(true)}>Oyuna gir<ArrowRight className="size-4"/></Button></div></div></div></section>
 <aside className="lg:border-l lg:border-border lg:pl-10"><div className="flex items-end justify-between"><div><p className="eyebrow">Arkadaşlar</p><h2 className="mt-2 font-display text-3xl font-semibold">{online} çevrimiçi</h2></div><Users className="size-5 text-muted-foreground"/></div><div className="relative mt-7"><Search className="absolute left-0 top-1/2 size-4 -translate-y-1/2 text-muted-foreground"/><Input className="pl-7" placeholder="Arkadaş ara" value={query} onChange={e=>setQuery(e.target.value)}/></div><div className="mt-6 divide-y divide-border">{visible.length?visible.map(friend=><div key={friend.id} className="flex items-center gap-3 py-4"><div className="relative"><Avatar><AvatarFallback>{initials(friend.name)}</AvatarFallback></Avatar><span className={cn("absolute bottom-0 right-0 size-2.5 rounded-full border-2 border-background",friend.online?"bg-foreground":"bg-muted-foreground/40")}/></div><div className="min-w-0 flex-1"><p className="truncate text-sm font-medium">{friend.name}</p><p className="mt-0.5 text-xs text-muted-foreground">Seviye {friend.level} · {friend.online?"Çevrimiçi":relativeTime(friend.lastSeen)}</p></div><ChevronRight className="size-4 text-muted-foreground"/></div>):<div className="py-14 text-center"><Users className="mx-auto size-6 text-muted-foreground"/><p className="mt-4 text-sm font-medium">Arkadaş listen sessiz.</p><p className="mt-2 text-xs leading-relaxed text-muted-foreground">Oyunda kurduğun ilişkiler burada otomatik görünecek.</p></div>}</div></aside></div></main>{playing&&<GameView updateTime={updateTime} onClose={()=>setPlaying(false)}/>}</div>
}
function Stat({label,value,icon}:{label:string;value:number;icon?:React.ReactNode}){return <div className="border-r border-border py-7 last:border-r-0 md:px-6 md:first:pl-0"><div className="flex items-center gap-2 text-xs uppercase tracking-[.16em] text-muted-foreground">{icon&&<span className="[&>svg]:size-3">{icon}</span>}{label}</div><p className="mt-2 font-display text-3xl font-semibold">{value.toLocaleString("tr-TR")}</p></div>}

export default function App(){
 const [dark,setDarkState]=useState(()=>localStorage.getItem("theme")!=="light"),[authOpen,setAuthOpen]=useState(false),[user,setUser]=useState<Player|null>(null),[updateTime,setUpdateTime]=useState("0"),[dashboard,setDashboard]=useState(false),[google,setGoogle]=useState(false),[discord,setDiscord]=useState(false),[authError,setAuthError]=useState(""),[loading,setLoading]=useState(true)
 const setDark=(v:boolean)=>{setDarkState(v);localStorage.setItem("theme",v?"dark":"light")}
 useEffect(()=>{document.documentElement.classList.toggle("dark",dark)},[dark])
 const refresh=()=>fetch("/api/me").then(async r=>{if(!r.ok){setUser(null);return}const d=await r.json();setUser(d.user);setUpdateTime(d.updateTime)}).finally(()=>setLoading(false))
 useEffect(()=>{refresh();fetch("/api/auth/status").then(r=>r.json()).then(d=>{setGoogle(Boolean(d.google));setDiscord(Boolean(d.discord))});const p=new URLSearchParams(location.search),auth=p.get("auth");if(auth&&["google-not-configured","google-failed","discord-not-configured","discord-failed"].includes(auth)){const provider=auth.startsWith("discord")?"Discord":"Google";setAuthError(auth.endsWith("failed")?`${provider} ile giriş tamamlanamadı.`:`${provider} bağlantısı henüz yapılandırılmadı.`);setAuthOpen(true);history.replaceState({},"","/")}},[])
 const logout=async()=>{await fetch("/api/auth/logout",{method:"POST"});setUser(null);setDashboard(false)}
 if(loading)return <div className="grid min-h-screen place-items-center"><div className="size-8 animate-spin rounded-full border border-border border-t-foreground"/></div>
 return <><Landing user={user} onAuth={()=>{setAuthError("");setAuthOpen(true)}} onEnter={()=>setDashboard(true)} dark={dark} setDark={setDark}/>{dashboard&&user&&<div className="fixed inset-0 z-40 overflow-auto bg-background"><Dashboard user={user} updateTime={updateTime} onBack={()=>setDashboard(false)} onLogout={logout} dark={dark} setDark={setDark}/></div>}<AuthPanel open={authOpen} onClose={()=>setAuthOpen(false)} onSuccess={refresh} googleEnabled={google} discordEnabled={discord} authError={authError}/></>
}
