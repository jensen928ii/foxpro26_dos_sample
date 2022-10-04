if parameters() < 4 and ;
 	 parameters() > 0
	if lookupmode
	  do postremote
	else
	  do preremote
	endif	
	return
endif

***
* control variable

private addmode, ;
				oldkey, ;
				arraysize, ;
				itemfrom, ;
				itemlen, ;
				oldv, ;
				oldv2, ;
				maxno, ;
				pointer, ;
				editfield, ;
				itemfindx, ;
				warning, ;
				savecall, ;
				saveprint,;
				saveprint2, ;
				saveprint3, ;
				breakhour, ;
				breakmin, ;
				starthour, ;
				startmin, ;
				before, ;
				after, ;
				tempalias, ;
				headfile, ;
				linefile, ;
				linkdbf, ;
				linkmodule, ;
				savemodule, ;
				cashdrawer, ;
				checkno, ;
				idcheck, ;
				delimiter, ;
				holdvia, ;
				holdcat, ;
				stampcheck, ;
				roundcents, ;
				cashdirect, ;
				manaualtext, ;
				edittitle, ;
				discbyamt, ;
				sortby, ;
				startobj, ;
				autotable, ;
				today, ;
				editterms, ;
				askduedate, ;
				byserver, ;
				askcompany, ;
				autoclear, ;
				askc2, ;
				askemploy, ;
				creditterm, ;
				creditvia, ;
				autologin, ;
				postdate, ;
				autoinit, ;
				initprg, ;
				initvia, ;
				random, ;
				areafile, ;
				autor, ;
				asknotice, ;
				asknotice2, ;
				sort2bycat, ;
				printat1, ;
				automode, ;
				autovia, ;
				autolow, ;
				autohigh, greeting, ;
				promptr1, ;
				forceyes, exitkey, ;
				editkey, infokey, ;
				addkey, ;
				clearkey, autocard, ;
				tipsmode, cardi, ;
				splitkey, cardresult, ;
				timelog, ;
				applycash, ;
				hello1, offkey, ;
				afteroff, tablefield, ;
				checkorder, ;
				clicheck, ;
				numlock1, ;
				pbwindow, ;
				lastcat, ;
				min1, ;
				setpaykey, ;
				confirm, ;
				longitem, ;
				uselast, ;
				lookufield, ;
				mid, ;
				touchscreen, ;
				resetcode, ;
				today1, ;
				shipkey, ;
				pricekey, ;
				custkey, ;
				exitprg

m.exitprg = ''
m.custkey = ''
m.pricekey = ''
m.shipkey = ''
m.today1  = ''
m.resetcode = 0
m.touchscreen = .f.
m.mid = ''				
m.uselast = ''
m.lookufield = ''				
m.longitem = ''
m.confirm = ''
m.setpaykey = ''
m.min1 = ''
m.lastcat = ''
m.pbwindow = 'jbrowser'				
m.numlock1 = ''
m.clicheck = ''
m.tablefield = ''				
m.checkorder = ''
m.afteroff = 0				
m.offkey = ''	
m.addkey = ''			
m.hello1 = ''				
m.applycash = ''				
m.timelog = ''				
m.cardresult = ''
m.splitkey = ''				
m.cardi = ''				
m.tipsmode = ''				
m.autocard = ''				
m.editkey = ''
m.infokey = ''
m.clearkey = ''
m.exitkey = ''				
m.promptr1 = ''
m.forceyes = ''
m.greeting = ''
m.creditterm = ''
m.creditrate = 0
m.creditvia = ''
m.autolow = 0
m.autohigh = 0
m.autovia = ''				
m.automode = ''
m.printat1 = ''				
m.sort2bycat = ''
m.saveprint3 = ''
m.asknotice = ''
m.asknotice2 = ''
m.autor = ''
m.areafile = ''

if !m.lookupmode
	m.login = ''
endif
m.random = ''				
m.autologin = ''
m.postdate = ''
m.initvia = ''
m.askemploy = ''
m.autoclear = ''
m.askc2 = ''
m.initprg = ''
m.autoinit = ''				
m.askcompany = ''
m.byserver = ''
m.askduedate = ''
m.editterms = ''
m.today = {//}
m.autotable = ''
m.startobj = 0
m.sortby = ''				
m.discbyamt = ''				
m.manualtext = 'manual'				
m.edittitle = ''
m.cashdirect = ''
m.roundcents = ''
m.stampcheck = ''
m.delimiter = ''
m.holdvia = ''
m.holdcat = ''
m.idcheck = ''
m.checkno = ''
m.cashdrawer = ''				
m.savemodule = ''				
m.linkdbf = ''
m.linkmodule = ''
m.tempalias = 'pos3'
m.headfile = 'pos'
m.linefile = 'pos2'				
m.breakhour = 0
m.breakmin = 0
m.starthour = 0
m.startmin = 0
m.before = ''
m.after = ''
m.oldkey = ''
m.oldv = ''
m.oldv2 = 'pos98'
m.arraysize = 15
m.itemlen = 8
m.itemfrom = 15
m.itemfindx = .t.
m.addmode = .t.
m.editfield = .t.
m.savecall = ''
m.saveprint = ''
m.saveprint2 = ''
m.warning = ''
m.maxno = 1
m.pointer = 1

private catsearch
m.catsearch = ''

***
* header fields variable

private	pos, ;
				clients, orderdate, ;
				deliveryon, taxrate, ;
				terms, discdate, discper ;
				duedate, via, fob, ;
				subtotal, salestax, discount, ;
				nettotal, ;
				total, balance, note, ;
				firstname, ;
				lastname, ;
				address1, ;
				address2, ;
				address3, ;
				city, ;
				state, ;
				zip, ;
				zip4, ;
				employee, ;
				surcharge, ;
				chargerate, ;
				approved, ;
				register, ;
				company, ;
				misc, ;
				misc2, ;
				notepad, ;
				member, ;
				off

				
m.off = 0				
m.member = ''				
m.notepad = ''
m.misc = ' '
m.misc2 = ''
m.company = ''
m.register = ''
m.approved = .f.
m.pos = ''
m.clients = ''
m.orderdate = date()
m.deliveryon = date()
m.taxrate = 0
m.terms = ''
m.discdate = date()
m.discper = 0
m.duedate = date()
m.via = ''
m.fob = ''
m.subtotal = 0
m.nettotal = 0
m.salestax = 0
m.discount = 0
m.total = 0
m.balance = 0
m.note = ''
m.firstname = ''
m.lastname = ''
m.address1 = ''
m.address2 = ''
m.address3 = ''
m.city = ''
m.state = ''
m.zip = ''
m.zip4 = ''
m.employee = ''
m.surcharge = 0
m.chargerate = 0
* payment headfile

private payment, change, method, cardno
m.method = ''
m.payment = 0
m.change = 0
m.cardno = ''

*line
dimension itemfile(m.arraysize), ;
					lno(m.arraysize), ;
					itemcode(m.arraysize), ;
					link(m.arraysize), ;
					keylink(m.arraysize)


dimension	itemname(m.arraysize), ;
					unit0(m.arraysize), ;
					title(m.arraysize), ;
					tracking(m.arraysize), ;
					sort1(m.arraysize), ;
					sort0(m.arraysize), ;
					subtitle(m.arraysize), ;
					shipped(m.arraysize), ;
					parttax(m.arraysize), ;
					labortax(m.arraysize), ;
					price(m.arraysize), ;
					laborhour(m.arraysize), ;
					laborcost(m.arraysize), ;
					performby(m.arraysize), ;
					backorder(m.arraysize), ;
					linedisc(m.arraysize), ;
					extended(m.arraysize), ;
					checkin(m.arraysize), ;
					returndate(m.arraysize), ;
					commission(m.arraysize), ;
					name1(m.arraysize), ;
					cost(m.arraysize), ;
					minprice(m.arraysize)
					


*line
store '' to itemfile
store '' to link
store '' to keylink
store 0 to lno
store '' to itemcode

*line
store '' to itemname
store '' to title
store '' to subtitle
store 1 to shipped
store '' to parttax
store 0 to price
store '' to labortax
store 0 to laborhour
store 0 to laborcost
store '' to performby
store 0 to backorder
store 0 to linedisc
store 0 to extended
store {//} to checkin
store {//} to returndate
store 0 to commission
store '' to name1
store 0 to cost
store 0 to minprice
store '' to unit0
store '' to tracking
store '' to sort1
store '' to sort0

*display variables
private language, ;
				m.m00, ;
				m0, m1, m2, m3, m4, m5, m6, m7, ;
				m8, m9, m10, m11, m12, m13, m14, ;
				m15, m16, m17, m18, m19, m20, ;
				m21, m22, m23, ;
				m00a, m0a, m1a, m2a, m3a, m4a, ;
				m5a, m6a, m7a, m8a, m9a, m10a, ;
				m11a, m12a, m13a, m14a, m15a, ;
				m16a, m17a, m18a, m19a, m20a, ;
				m21a, m22a, m23a, ;
				membercredit

m.membercredit = 0
m.language = ''
m.m00 = ''
m.m0 = ''
m.m1 = ''
m.m2 = ''
m.m3 = ''
m.m4 = ''
m.m5 = ''
m.m6 = ''
m.m7 = ''
m.m8 = ''
m.m9 = ''
m.m10 = ''
m.m11 = ''
m.m12 = ''
m.m13 = ''
m.m14 = ''
m.m15 = ''
m.m16 = ''
m.m17 = ''
m.m18 = ''
m.m19 = ''
m.m20 = ''
m.m21 = ''
m.m22 = ''
m.m23 = ''
m.m00 = ''
m.m0a = ''
m.m1a = ''
m.m2a = ''
m.m3a = ''
m.m4a = ''
m.m5a = ''
m.m6a = ''
m.m7a = ''
m.m8a = ''
m.m9a = ''
m.m10a = ''
m.m11a = ''
m.m12a = ''
m.m13a = ''
m.m14a = ''
m.m15a = ''
m.m16a = ''
m.m17a = ''
m.m18a = ''
m.m19a = ''
m.m20a = ''
m.m21a = ''
m.m22a = ''
m.m23a = ''
m.m00a = ''

* disable screen variable

private _misc, ;				
				_lno, ;
				_via, ;
				_company, ;
				_employee, ;
				_clients, ;
				_notepad, ;
				initprog
				
m.areafrom = ''
m.initprog = ''
m._misc = ''
m._lno = ''
m._via = ''
m._company = ''
m._employee = ''
m._clients = ''
m._notepad = ''

if rdlevel() = 5
  =stopbox('NOT ENOUGH MEMORY')
  return
endif

if parameters()=0
  m.lreturn = ''
	m.keyscope = '.t.'
	m.lookupmode = .f.
	m.lreturn = ''
	m.prekey = ''
	m.predata1 = ''

**alert
* if !empty(m.predataX)
*   screen activate:
*		add show get m.predatax disable
*		procedure init
*		add m.XXX = m.predataX
* endif
endif

push menu _msysmenu
do selectm
do loadtable
do init

if !scheck('pos98','')
  return
endif

