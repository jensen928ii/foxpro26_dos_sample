External Array 	itemfile, lno, ;
	itemcode, Link, keylink, ;
	itemname, Title, ;
	tracking, sort1, sort0, subtitle, ;
	shipped, parttax, ;
	labortax, price, ;
	laborhour, laborcost, ;
	performby, backorder, ;
	linedisc, Extended, ;
	checkin, returndate, ;
	unit0, commission, ;
	minprice, cost, name1

Procedure Init
Private i, j, loopinit

m.loopinit = .T.
m.j = .T.
i = 0

If !scheck('pos98','init')
	Return
Endif

*jensen

If !scheck2('pos98','tabled')
	if m.addmode
	  if m.balance > 0 
	    m.oldv = 'V' + alltrim(str(m.balance,10,2))
		do save2
		do tabled2
	  endif
	endif
Endif

*template
m.numlock1 = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','numlock')),1))

If m.numlock1 != 'N'
	=Numlock(.T.)
Endif
m.itemfindx = .T.
m.oldkey = ''
m.addmode = .T.
m.maxno = 1
m.pointer = 1
m.afteroff = 0
m.resetcode = Val(getlocal('pos98','resetcode'))
m.mid = Upper(Alltrim(getlocal('pos98','mid')))
m.cardi = Alltrim(getlocal('pos98','cardi'))
m.uselast = Upper(Alltrim(getlocal('pos98','uselast')))
m.longitem = Upper(Alltrim(getlocal('pos98','longitem')))
m.greeting = Alltrim(getlocal('pos98','greeting'))
m.areafrom = Alltrim(getlocal('pos98','areafrom'))
m.creditterm = Alltrim(getlocal('pos98','creditterm'))
m.creditrate = Val(Alltrim(getlocal('pos98','creditrate')))
m.creditvia = Alltrim(getlocal('pos98','creditvia'))
m.initprg = Alltrim(getlocal('pos98','initprg'))
m.automode = Alltrim(getlocal('pos98','automode'))
m.autovia = Alltrim(getlocal('pos98','autovia'))
m.initvia = Alltrim(getlocal('pos98','initvia'))
m.cashdrawer = Alltrim(getlocal('pos98','cashdrawer'))
m.areafile = Alltrim(getlocal('pos98','areafile'))
m.linkdbf = Alltrim(getlocal('pos98','linkdbf'))
m.linkmodule = Alltrim(getlocal('pos98','linkmodule'))
m.savemodule = Alltrim(getlocal('pos98','savemodule'))
m.askemploy = Alltrim(getlocal('pos98','askemploy'))
m.asknotice = Alltrim(getlocal('pos98','asknotice'))
m.asknotice2 = Alltrim(getlocal('pos98','asknotice2'))
m.autoclear = Alltrim(getlocal('pos98','autoclear'))
m.askc2 = Alltrim(getlocal('pos98','askc2'))
m.askcompany = Alltrim(getlocal('pos98','askcompany'))
m.askmember = Alltrim(getlocal('pos98','askmember'))
m.exitkey = Alltrim(getlocal('pos98','exitkey'))
m.addkey = Alltrim(getlocal('pos98','addkey'))
m.offkey = Alltrim(getlocal('pos98','offkey'))
m.infokey = Alltrim(getlocal('pos98','infokey'))
m.shipkey = Alltrim(getlocal('pos98','shipkey'))
m.pricekey = Alltrim(getlocal('pos98','pricekey'))
m.custkey = alltrim(getlocal('pos98','custkey'))
m.checkorder = Alltrim(getlocal('pos98','checkorder'))
m.min1 = Alltrim(getlocal('pos98','min1'))
m.setpaykey = Alltrim(getlocal('pos98','setpaykey'))
m.confirm = Alltrim(getlocal('pos98','confirm'))
m.exitprg = alltrim(getlocal('pos98','exitprg'))

If Empty(m.checkorder)
	m.checkorder = 'clients'
Endif
m.tablefield = Alltrim(getlocal('pos98','tablefield'))
If Empty(m.tablefield)
	m.tablefield = 'code'
Endif

m.lookufield = Alltrim(getlocal('pos98','lookufield'))

If Empty(m.lookufield)
	m.lookufield = 'clients,misc:h=[No.],method,total,via width 10'
Endif

m.editkey = Alltrim(getlocal('pos98','editkey'))
m.splitkey = Alltrim(getlocal('pos98','splitkey'))
m.clearkey = Alltrim(getlocal('pos98','clearkey'))
m.sortby = Alltrim(getlocal('pos98','sortby'))
If Val(Alltrim(getlocal('pos98','_jdblclick'))) > 0
	_jdblclick=Val(Alltrim(getlocal('pos98','_jdblclick')))
Endif
If Empty(m.sortby)
	m.sortby = 'getno'
Endif
m.manualtext = Alltrim(getlocal('pos98','manualtext'))
m.hello1 = Alltrim(getlocal('pos98','hello1'))
If Empty(m.manualtext)
	m.manualtext = '+'
Endif
m.holdvia = Alltrim(getlocal('pos98','holdvia'))
m.holdcat = Alltrim(getlocal('pos98','holdcat'))

m.delimiter = Alltrim(getlocal('pos98','delimiter'))

m.applycash = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','applycash')),1))

m.autocard = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','autocard')),1))


m.printat1 = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','printat1')),1))

m.sort2bycat = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','sort2bycat')),1))

m.random = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','random')),1))

m.postdate = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','postdate')),1))

m.timelog = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','timelog')),1))

m.autologin = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','autologin')),1))

m.autoinit = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','autoinit')),1))

m.autor = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','autor')),1))

m._lno = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','_lno')),1))

m._misc = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','_misc')),1))

m._via = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','_via')),1))
m._company = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','_company')),1))
m._employee = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','_employee')),1))
m._clients = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','_clients')),1))
m._notepad = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','_notepad')),1))
m.promptr1 = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','promptr1')),1))
m.tipsmode = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','tipsmode')),1))
m.forceyes = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','forceyes')),1))

m.membercredit = 0

If m._misc = 'N'
	Show Get m.misc Disable
Else
	Show Get m.misc Enable
Endif

If m._via = 'N'
	Show Get m.via Disable
Else
	Show Get m.via Enable
Endif

If m._company = 'N'
	Show Get m.company Disable
Else
	Show Get m.company Enable
Endif

If m._employee = 'N'
	Show Get m.employee Disable
Else
	Show Get m.employee Enable
Endif

If m._clients = 'N'
	Show Get m.clients Disable
Else
	Show Get m.clients Enable
Endif

If m._notepad = 'N'
	Show Get m.notepad Disable
Else
	Show Get m.notepad Enable
Endif

m.byserver = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','byserver')),1))

m.askduedate = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','askduedate')),1))

m.editterms = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','editterms')),1))


m.editfield = Iif(Upper(;
	left(;
	alltrim(;
	getlocal('pos98','editfield')),1));
	='N',.F.,.T.)
m.saveprint = Alltrim(getlocal('pos98','saveprint'))
m.saveprint2 = Alltrim(getlocal('pos98','saveprint2'))
m.saveprint3 = Alltrim(getlocal('pos98','saveprint3'))
m.savecall = Alltrim(getlocal('pos98','savecall'))
m.language = Upper(;
	left(;
	alltrim(getlocal('pos98','language')),1))
m.autotable = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','autotable')),1))

m.discbyamt = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','discbyamt')),1))

m.cashdirect = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','cashdirect')),1))

m.roundcents = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','roundcents')),1))

m.edittitle = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','edittitle')),1))

m.stampcheck = alltrim(getlocal('pos98','stampcheck'))
m.warning = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','warning')),1))
m.checkno = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','checkno')),1))
m.clicheck = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','clicheck')),1))
m.idcheck = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','idcheck')),1))

*module
Select (m.headfile)
Scatter Memo Memvar Blank

m.clients = Alltrim(getlocal('pos98','clients'))

m.autolow = Val(getlocal('pos98','autolow'))
m.autohigh = Val(getlocal('pos98','autohigh'))
m.breakhour = Val(getlocal('pos98','breakhour'))
m.breakmin = Val(getlocal('pos98','breakmin'))
m.before = Alltrim(getlocal('pos98','before'))
m.after = Alltrim(getlocal('pos98','after'))
m.starthour = Val(getlocal('pos98','starthour'))
m.startmin = Val(getlocal('pos98','startmin'))


m.orderdate = Iif( (Val(Sys(2)) < 3600 * m.starthour + ;
	60 * m.startmin),Date()-1,Date())


m.today1 = alltrim(getglobal('pos98','today1'))
if ctod(m.today1) != m.orderdate
	select global
	locate for program='pos98' .and. function = 'today1'
	if lockr()
		replace setting with dtoc(m.orderdate)
		unlock	
	endif
	locate for program = 'pos98' .and. function = 'counter2'
	if lockr()
		replace setting with alltrim(str(m.autolow))
		unlock	
	endif
endif

m.subtotal = 0
m.salestax = 0
m.discount = 0
m.off = 0
m.total = 0
m.balance = 0
m.note = ''
m.register = Alltrim(getlocal('pos98','register'))
m.employee = Alltrim(getlocal('pos98','employee'))
m.discdate = Val(getlocal('pos98','discdate')) ;
	+ m.orderdate
m.discper = Val(getlocal('pos98','discper'))
m.deliveryon = 	Val(getlocal('pos98','deliveryon')) ;
	+ m.orderdate
m.taxrate = Val(getlocal('pos98','taxrate'))
m.startobj = Val(getlocal('pos98','startobj'))

If m.autohigh = 0
	m.autohigh = 99
Endif


If m.breakhour != 0 .And. ;
		m.starthour != 0

	If (Val(Sys(2)) >= 3600 * m.breakhour + ;
			60 * m.breakmin) .Or. ;
			(Val(Sys(2)) < 3600 * m.starthour + ;
			60 * m.startmin)
		m.terms = m.after
	Else
		m.terms = m.before
	Endif

Else
	m.terms = Alltrim(getlocal('pos98','terms'))
Endif

m.via = getlocal('pos98','via')
m.catsearch = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','category')),1))
m.discount = Val(getlocal('pos98','discount'))
m.method = Alltrim(getlocal('pos98','method'))
m.cardno = ''
m.payment = 0
m.surcharge = 0
m.change = 0
m.chargerate = Val(getlocal('pos98','chargerate'))
m.city = Alltrim(getlocal('pos98','city'))
m.state = Alltrim(getlocal('pos98','state'))
m.zip = Alltrim(getlocal('pos98','zip'))
m.zip4 = Alltrim(getlocal('pos98','zip4'))
m.approved = .F.

=getglobal('pos98','counter1')
=getglobal('pos98','counter2')

*template

If Used(m.tempalias)
	Use In (m.tempalias)
Endif
Select (m.linefile)
Copy Stru To (m.tempalias) With Cdx
Use (m.tempalias) In 0 Excl
Select (m.tempalias)
Zap
Reindex
Append Blank
Replace lno With m.maxno
For i = 1 To m.arraysize
	Do emptykid With i
Endfor
lno[1] = m.maxno
For i = 2 To m.arraysize
	Do hidekid With i
Endfor

If !Wexist('pos98')
	Return
Endif

Do picklang

If !Empty(m.login)
	If scheck2('pos98','delete')
		Show Gets
		Return
	Endif
Endif

Do While loopinit
	m.loopinit = .F.

	If Empty(m.login) .Or. m.autologin != 'N'
		Do login2
		Do selectm
		Do checktl
		If m.oldv2 = 'restart'
			m.oldv2 = ''
			Do Init
			Return
		Endif
	Endif

	If !Empty(m.greeting)
		Do Alltrim(m.progdrv) + 'display.app' With .T.,m.greeting
	Endif

	Do While m.j
		If m.autoinit != 'N'
			Do startinit
		Endif
		If Alltrim(m.clients) = '*'
			m.clients = ''
			Do checkme
			If m.addmode
				Loop
			Endif
		Endif
		If !m.loopinit
			Do getclients
			If !m.touchscreen
				If Empty(m.clients)
					Do checkme
					If m.addmode
						If Lastkey() = 27
							Exit
						Else
							Loop
						Endif
					Endif
				Endif
			Endif
			If (Lastkey() = 27) .Or. ;
					!Empty(m.clients)
				Exit
			Endif
		Endif
	Enddo

	If m.loopinit
		m.j = .T.
		Loop
	Endif

	If !scheck2('pos98','host')
		If Empty(m.employee)
			m.employee = m.login
		Endif
	Endif

	_Curobj = firstkid()
	If !m.addmode
		Return
	Endif

	If Lastkey() != 27
		Do getemp
		Do getcompany
		Do getmember
		Do getmisc
		If !Empty(m.via)
			_Curobj = firstkid()
		Endif
	Endif
	Show Gets
	Do init2
Enddo
Return

Procedure init2
Return

Procedure picklang
If Language != 'N'
	m.m00 = Alltrim(getlocal('pos98','m00'))
	m.m0 = Alltrim(getlocal('pos98','m0'))
	m.m1 = Alltrim(getlocal('pos98','m1'))
	m.m2 = Alltrim(getlocal('pos98','m2'))
	m.m3 = Alltrim(getlocal('pos98','m3'))
	m.m4 = Alltrim(getlocal('pos98','m4'))
	m.m5 = Alltrim(getlocal('pos98','m5'))
	m.m6 = Alltrim(getlocal('pos98','m6'))
	m.m7 = Alltrim(getlocal('pos98','m7'))
	m.m8 = Alltrim(getlocal('pos98','m8'))
	m.m9 = Alltrim(getlocal('pos98','m9'))
	m.m10 = Alltrim(getlocal('pos98','m10'))
	m.m11 = Alltrim(getlocal('pos98','m11'))
	m.m12 = Alltrim(getlocal('pos98','m12'))
	m.m13 = Alltrim(getlocal('pos98','m13'))
	m.m14 = Alltrim(getlocal('pos98','m14'))
	m.m15 = Alltrim(getlocal('pos98','m15'))
	m.m16 = Alltrim(getlocal('pos98','m16'))
	m.m17 = Alltrim(getlocal('pos98','m17'))
	m.m18 = Alltrim(getlocal('pos98','m18'))
	m.m19 = Alltrim(getlocal('pos98','m19'))
	m.m20 = Alltrim(getlocal('pos98','m20'))
	m.m21 = Alltrim(getlocal('pos98','m21'))
	m.m22 = Alltrim(getlocal('pos98','m22'))
	m.m23 = Alltrim(getlocal('pos98','m23'))
	Do picklang2
Else
	m.m00 = Alltrim(getlocal('pos98','m00a'))
	m.m0 = Alltrim(getlocal('pos98','m0a'))
	m.m1 = Alltrim(getlocal('pos98','m1a'))
	m.m2 = Alltrim(getlocal('pos98','m2a'))
	m.m3 = Alltrim(getlocal('pos98','m3a'))
	m.m4 = Alltrim(getlocal('pos98','m4a'))
	m.m5 = Alltrim(getlocal('pos98','m5a'))
	m.m6 = Alltrim(getlocal('pos98','m6a'))
	m.m7 = Alltrim(getlocal('pos98','m7a'))
	m.m8 = Alltrim(getlocal('pos98','m8a'))
	m.m9 = Alltrim(getlocal('pos98','m9a'))
	m.m10 = Alltrim(getlocal('pos98','m10a'))
	m.m11 = Alltrim(getlocal('pos98','m11a'))
	m.m12 = Alltrim(getlocal('pos98','m12a'))
	m.m13 = Alltrim(getlocal('pos98','m13a'))
	m.m14 = Alltrim(getlocal('pos98','m14a'))
	m.m15 = Alltrim(getlocal('pos98','m15a'))
	m.m16 = Alltrim(getlocal('pos98','m16a'))
	m.m17 = Alltrim(getlocal('pos98','m17a'))
	m.m18 = Alltrim(getlocal('pos98','m18a'))
	m.m19 = Alltrim(getlocal('pos98','m19a'))
	m.m20 = Alltrim(getlocal('pos98','m20a'))
	m.m21 = Alltrim(getlocal('pos98','m21a'))
	m.m22 = Alltrim(getlocal('pos98','m22a'))
	m.m23 = Alltrim(getlocal('pos98','m23a'))
	Do picklang2
Endif
Do selectm
Return

Procedure picklang2
Private i
m.i = 1
If Language != 'N'
	Select (m.tempalias)
	Replace All tracking With Title
	For i = 1 To m.arraysize
		tracking(i) = Title(i)
	Endfor
Else
	Select (m.tempalias)
	Replace All tracking With subtitle
	For i = 1 To m.arraysize
		tracking(i) = subtitle(i)
	Endfor
Endif
Show Gets
Return

Procedure Table

If !scheck('pos98','table')
	Return
Endif

* Jkey .........................
* parameter 	lcwind, lcdir, ;
*							lcfile, lcorder, ;
*							lcField, lcCond

m.autotable = Upper(;
	left(;
	alltrim(;
	getlocal('pos98','autotable')),1))

Do Case
Case _Curobj = Objnum(m.zip)
	If jkey3('jbrowser',m.progdrv,;
			'zip','zip',;
			'zip','.t.')
		m.zip = zip.zip
		m.city = zip.city
		m.state = zip.state
		Show Get m.city
		Show Get m.state
		Show Get m.zip
	Endif
Case _Curobj = Objnum(m.terms)
	If jkey3('jbrowser',m.progdrv,;
			'terms','terms',;
			'terms','.t.')
		m.terms = terms.terms
		Show Get m.terms
		Do termsv
	Endif
Case _Curobj = Objnum(m.method)
	If jkey3('jbrowser',m.progdrv,;
			'method','method',;
			'method','.t.')
		m.method = method.method
		Show Get m.method
	Endif
Case _Curobj = Objnum(m.clients)
	If jkey3('jbrowser',m.progdrv,;
			'clients','clients',;
			'clients','.t.')
		m.clients = clients.clients
		Do rclients
	Endif
Case _Curobj = Objnum(m.via)
	If jkey3('jbrowser',m.progdrv,;
			'via','via',;
			'via, via2','.t.')
		m.via = via.via
		Show Get m.via
	Endif
Case _Curobj = Objnum(m.employee)
	If jkey3('jbrowser',m.progdrv,;
			'userid','userid',;
			'userid','.t.')
		m.employee = Userid.Userid
		Show Get m.employee
	Endif
Case _Curobj = Objnum(m.member)
	If jkey3('jbrowser',m.progdrv,;
			'member','member',;
			'member','.t.')
		m.member = member.member
		Show Get m.member
	Endif
Case _Curobj = Objnum(itemname(pointer))
	If jkey3('jbrowser',m.progdrv,;
			'modifier','content',;
			'content, content2','.t.')
		itemname(pointer) = Alltrim(itemname(pointer)) + ;
			' ' + ;
			alltrim(modifier.content)
		Show Get itemname(pointer)
	Endif
Case _Curobj = Objnum(name1(pointer))
	If jkey3('jbrowser',m.progdrv,;
			'employee','employee',;
			'firstname,lastname','.t.')
		name1(pointer) = employee.useridkey
		Show Get name1(pointer)
	Endif
Case _Curobj = Objnum(itemcode(pointer))
	If !mcheck()
		Return
	Endif
	Select opening
	Set Order To Item
	Select Catalog
	Set Rela To Upper(Alltrim(itemfile)+'.app') Into opening
	Count For Module = 'pos98'


	Do Case

	Case _Tally = 0
		=stopbox('Price Book not setup')
	Case _Tally = 1
		Locate For Module = 'pos98'
		If (m.catsearch != 'N') .And. ;
				(Upper(Catalog.catsearch) != 'N')
			If jkey3(m.pbwindow,m.progdrv,;
					'category','category2',;
					'category,category2' ,'program=['+Upper(Alltrim(Catalog.itemfile))+']')
				If jkey3(m.pbwindow,m.progdrv,;
						alltrim(Catalog.itemfile),m.sortby,;
						alltrim(m.tablefield), 'category=['+Alltrim(category.category) + ']')
					itemfile(pointer) = Catalog.itemfile
					m.oldv = Code
					Do pricekid
				Endif
			Endif
		Else
			If jkey3(m.pbwindow,m.progdrv,;
					alltrim(Catalog.itemfile),m.sortby,;
					alltrim(m.tablefield),'.t.')
				itemfile(pointer) = Catalog.itemfile
				m.oldv = Code
				Do pricekid
			Endif
		Endif

	Otherwise

		If jkey3(m.pbwindow,m.progdrv,;
				'catalog','itemfile',;
				'itemfile:H="Price Book",opening.content','module="pos98"')

			If (m.catsearch != 'N') .And. ;
					(Upper(Catalog.catsearch) != 'N')
				If jkey3(m.pbwindow,m.progdrv,;
						'category','category2',;
						'category,category2' ,'program=['+Alltrim(Catalog.itemfile)+']')
					If jkey3(m.pbwindow,m.progdrv,;
							alltrim(Catalog.itemfile),m.sortby,;
							alltrim(m.tablefield) ,'category=['+Alltrim(category.category) + ']')
						itemfile(pointer) = Catalog.itemfile
						m.oldv = Code
						Do pricekid
					Endif
				Endif
			Else
				If jkey3(m.pbwindow,m.progdrv,;
						alltrim(Catalog.itemfile),m.sortby,;
						alltrim(m.tablefield),'.t.')
					itemfile(pointer) = Catalog.itemfile
					m.oldv = Code
					Do pricekid
				Endif
			Endif

		Endif

	Endcase

	If Lastkey() != 27
		If icodecomm()
			If !m.editfield
				If m.pointer = m.arraysize
					Do i7forf
				Else
					Do forf
				Endif
			Else
				_Curobj = _Curobj + 1
			Endif
		Else
			Wait Window "item not valid"
		Endif
	Endif

Otherwise
	=stopbox('TABLE NOT AVAILABLE FOR THIS ITEM')
Endcase
Return

Procedure tablef
Private temp, N
m.temp = ''
m.oldv = ''
m.n = 1
If !scheck('pos98','tablef')
	Return
Endif
If Rdlevel() >= 5
	=stopbox('NOT ENOUGH MEMORY')
	Return
Endif
Do Case
Case _Curobj = Objnum(m.zip)
	m.oldv = m.zip
	Do m.progdrv+'zip.app' With .T.,'.t.',m.zip,'',''
	If m.oldv != m.zip
		m.city = zip.city
		m.state = zip.state
		Show Get m.city
		Show Get m.state
		Show Get m.zip
	Endif
Case _Curobj = Objnum(m.method)
	Do m.progdrv+'method.app' With .T.,'.t.',m.method,'',''
	Show Get m.method
Case _Curobj = Objnum(m.terms)
	Do m.progdrv+'terms.app' With .T.,'.t.',m.terms,'',''
	Show Get m.terms
Case _Curobj = Objnum(m.via)
	Do m.progdrv+'via.app' With .T.,'.t.',m.via,'',''
	Show Get m.via
Case _Curobj = Objnum(itemname(pointer))
	Do m.progdrv+'modifier.app' With .T.,'.t.',m.temp,'',''
	If m.oldv != m.temp
		itemname(pointer) = Alltrim(itemname(pointer)) + ;
			' ' + ;
			alltrim(modifier.content)
		Show Get itemname(pointer)
	Endif
	m.temp = ''
	Do m.progdrv+'object.app' With .T.,'.t.',m.temp,'',''
	If m.oldv != m.temp
		itemname(pointer) = Alltrim(itemname(pointer)) + ;
			' ' + ;
			alltrim(Object.content)
		Show Get itemname(pointer)
	Endif
Case _Curobj = Objnum(m.clients)
	m.oldv = m.clients
	Do m.progdrv+'clients.app' With .T.,'.t.',m.clients,'',''
	If m.oldv != m.clients
		m.clients = clients.clients
		Do rclients
	Endif
Case _Curobj = Objnum(itemcode(pointer))
	Select opening
	Set Order To Item
	Select Catalog
	Set Rela To Upper(Alltrim(itemfile)+'.app') Into opening
	If jkey3('jbrowser',m.progdrv,;
			'catalog','itemfile',;
			'itemfile:H="Price Book",opening.content','module="pos98"')
		Do savekid With 'pos98'
		Do m.progdrv+Alltrim(Catalog.itemfile)+'.app' ;
			with .T.,'.t.',m.oldv,'',''
		Do restorekid With 'pos98'
		itemcode(pointer) = m.oldv
		itemfile(pointer) = ""
		Do refreshkid
	Endif
	Select Catalog
	Set Rela To
Otherwise
	Do tablef2
Endcase
Return

Procedure tablef2
m.oldv = 'N'
Do save2
Do savekid With 'pos98'
If Empty(m.pos)
	Do m.progdrv+'payment.app' With .T.,'.t.','','',m.clients
Else
	Select payment2
	Set Order To
	Locate For itemcode = m.pos
	If Found()
		If jkey3('jbrowser',m.progdrv,;
				'payment2','itemcode',;
				'pay,split','itemcode=['+Alltrim(m.pos)+']')
			Do m.progdrv+'payment.app' With .T.,'.t.','',payment2.Payment,''
		Else
			Do m.progdrv+'payment.app' With .T.,'.t.','','',m.clients
		Endif
	Else

		m.temp = 0

		Do tablef2a

		If m.temp != 0
			If m.postdate != 'N'
				Do m.progdrv+'payment.app' With .T.,'.t.','','',m.clients, m.temp, m.orderdate
			Else
				Do m.progdrv+'payment.app' With .T.,'.t.','','',m.clients, m.temp
			Endif
		Endif
	Endif
Endif
Do restorekid With 'pos98'
Do refreshkid
*		select pos
*		set order to
*		locate for pos = m.pos
*		if found()
*			m.balance = &headfile->balance
*			show get m.balance
*		endif
Do loadkid With &headfile->pos, 'pos'
Return

Procedure tablef2a
Do Alltrim(m.progdrv) + 'askme.exe' With ;
	'n','How many splits?',m.temp
Return

Procedure Lookup
Private i, x
i = 0
x = ''

If _Curobj != Objnum(itemcode(pointer))
	If !scheck('pos98','lookup')
		Return
	Endif
Endif

If Empty(m.today)
	If !Empty(m.delimiter)
		m.keyscope = m.delimiter
	Else
		m.keyscope = '.t.'
	Endif
Else
	m.keyscope = 'orderdate = {' + Alltrim(Dtoc(m.today)) + '}'
Endif
Do Case
Case _Curobj = Objnum(m.misc)
	If jkey3('jbrowser',m.progdrv,;
			headfile,'misc',;
			m.lookufield,m.keyscope)
		Do loadkid With &headfile->pos, 'pos'
		m.oldkey = m.pos
	Endif
Case _Curobj = Objnum(itemcode(pointer))
	If !mcheck()
		Return
	Endif
	If Empty(itemcode(pointer))
		If jkey3('jbrowser',m.progdrv,;
				'lastitem','lastitem', ;
				'subtitle,title,itemcode,price width 16',;
				'clients=['+Alltrim(m.clients)+']')
			itemcode(pointer)=lastitem.itemcode
			itemfile(pointer)=lastitem.itemfile
			price(pointer)=lastitem.price
			Do sumext
		Endif
	Endif
Otherwise
	If jkey3('jbrowser',m.progdrv,;
			headfile,'clients',;
			m.lookufield,m.keyscope)
		Do loadkid With &headfile->pos, 'pos'
		m.oldkey = m.pos
	Endif
Endcase
Return

Procedure lookupf
Private temp1
If !scheck('pos98','lookupf')
	Return
Endif
If Rdlevel() >= 5
	=stopbox('NOT ENOUGH MEMORY')
	Return
Endif
Do Case
Otherwise
	Do m.progdrv+'clients.app' With .T.,'.t.',m.clients,'',''
	m.temp1 = 'Total Balance : ' + Alltrim(Str(clients.runbalance,10,2))
	If jkey3('jbrowser',m.progdrv,;
			headfile,'pos',;
			'misc:h=[No.],orderdate,total,balance',;
			'clients=['+Alltrim(m.clients)+']',;
			m.temp1)
		Do loadkid With &headfile->pos, 'pos'
		m.addmode = .F.
		m.oldkey = m.pos
	Else
		m.clients = m.oldv
	Endif
Endcase
Return

Procedure Delete
If !scheck('pos98','delete')
	Return
Endif
If !m.addmode .And. ;
		!Empty(m.pos)
********* new start
	Select Payment
	Set Order To
	Select payment2
	Set Order To
	Scan For itemcode = m.pos

		Select Payment
		Locate For Payment = payment2.Payment
		If Found()
			If lockr()
				Delete
				Unlock
			Endif
		Endif
		Select payment2
		Delete

	Endscan
	Select payment2
	Set Rela To
********* new end
	Do restoreme
	Select (m.headfile)
	Set Order To pos
	If Seek(m.pos)
		If really()
			If lockr()
				Delete
				Unlock
				Do addrun With -(m.balance)
				Select (m.linefile)
				Set Order To
				Locate For pos=m.pos
				Do While Found()
					Delete
					Continue
				Enddo
				Do Init
			Else
				=stopbox('CANNOT DELETE RECORD')
			Endif
		Endif
	Else
		=stopbox('RECORD NOT FOUND')
	Endif
Else
	=stopbox('EMPTY FORM')
Endif
Return

Procedure tabled
If !scheck('pos98','tabled')
	Return
Endif
Do Case
Otherwise
***new start
	If Empty(m.pos)
		=stopbox('You cannot void an empty check')
		Return
	Endif
	m.oldv = ''
	Select fob From fob Into Array b
	Do m.progdrv + 'apick.exe' With ;
		'Reason for cancel',b,m.oldv
	m.oldv = Alltrim(m.oldv)

	If !Empty(m.oldv)
		=okbox('Please enter a reason in detail')

		Select (m.headfile)
		Set Order To pos
		If Seek(m.pos)
			Do Alltrim(m.progdrv)+'notepad.exe' With ;
				m.headfile, 'notepad'
		Endif
		do tabled2
		Do loadkid With m.pos, 'pos'
	Endif

***new end
Endcase
Return

procedure tabled2
		Select Payment
		Set Order To Payment
		Select payment2
		Set Rela To Payment Into Payment
		Set Order To
		Scan For itemcode = m.pos
			Select Payment
			If lockr()
				Replace amount With amount - payment2.pay
				Unlock
			Endif
			Select payment2
			Delete
		Endscan
		Select payment2
		Set Rela To
		If lockf()
			Delete All For itemcode = m.pos
			Unlock
		Endif
		Select pos
		Set Order To pos
		If Seek(m.pos)
			If lockr()
				Replace balance With 0
				Replace via With m.oldv
				Replace subtotal With 0
				Replace salestax With 0
				Replace Total With 0

				If m.postdate = 'N'
					Replace post With Date()
				Else
					Replace post With pos.orderdate
				Endif

				Unlock
			Endif
			m.balance = 0
			m.via = m.oldv
			Show Get m.balance
			Show Get m.via
		Endif
		Select (m.tempalias)
		Replace All shipped With 0
		Replace All Extended With 0
		Do linesave
return


Procedure Save
If !scheck('pos98','save')
	Return
Endif

If !allvalid()
	Return
Endif

If !Empty(m.greeting)
	Do Alltrim(m.progdrv) + 'display.app' ;
		with .F.,'Amt Due : ' + ;
		str(m.payment,10,2) + ;
		'Change  : ' + Str(m.change,10,2)
Endif

m.oldv = ''

If m.promptr1 = 'N'
	If m.payment > 0
		m.oldv = 'Y'
	Else
		m.oldv = 'N'
	Endif
Else
	If m.forceyes = 'N'
		m.oldv = alert('?','yNc',-1,-1,;
			'Print Receipt : ' + ;
			alltrim(m.method), ;
			'Pay : ' + Alltrim(Str(m.payment,10,2)),  ;
			'Change : ' + Alltrim(Str(m.change,10,2)), ;
			'Tips : ' + Alltrim(Str(m.surcharge,10,2)) )
	Else
		m.oldv = alert('?','Ync',-1,-1,;
			'Print Receipt : ' + ;
			alltrim(m.method), ;
			'Pay : ' + Alltrim(Str(m.payment,10,2)),  ;
			'Change : ' + Alltrim(Str(m.change,10,2)), ;
			'Tips : ' + Alltrim(Str(m.surcharge,10,2)) )
	Endif
	If m.oldv = 'Y'
		If m.autoclear != 'N'
			If Left(m.clients,1) != '*'
				If Alltrim(m.via) = Alltrim(m.initvia)
					m.clients = '*' + Alltrim(m.clients)
				Endif
			Endif
		Endif
	Endif
Endif

If m.oldv = 'C'
	Return
Endif

Do saveclients
Do save2
m.addmode = .f.
If m.lookupmode
	m.lreturn = m.pos
	Clear Read
Else
	if m.change > 0
		wait window 'Change : ' + Str(m.change,10,2)
	else
		Wait Window

	endif
	Do Init
Endif
Return

Procedure save2

Private temp1xxx, savemethod

m.savemethod = alphanum(m.method,'Aa')
if left(m.method,1) = m.splitkey
  m.method = splitkey
endif

temp1xxx = 0.00

If m.clients = m.automode
	Select Global
	Set Order To
	Locate For Program='pos98' .And. ;
		function = 'counter1'
	If Found()
		If lockr()
			m.clients = Alltrim(Str(Val(Global.setting)))

			If Val(m.clients) > m.autohigh
				m.clients = Alltrim(Str(m.autolow))
				Replace Global.setting With ;
					alltrim(Str(Val(m.clients)+1))
			Else
				If Val(m.clients) < m.autolow
					m.clients = Alltrim(Str(m.autolow))
					Replace Global.setting With ;
						alltrim(Str(Val(m.clients)+1))
				Else
					Replace Global.setting With ;
						alltrim(Str(Val(Global.setting)+1))
				Endif
			Endif
			Unlock
		Endif
	Else
		=stopbox('Error locating available slot for customer')
		Return
	Endif
Endif

Select (m.headfile)

If m.addmode

	If lockf()
		If Empty(m.pos)

			If m.random != 'N'
				m.pos=getts( headfile, ;
					'pos', ;
					'getno')
			Else
				m.pos=getnextno( headfile, ;
					'pos', ;
					'getno')
			Endif

			If Empty(m.misc)
				If m.stampcheck != 'N'
					if alltrim(m.via) $ m.stampcheck
	Select Global
	Set Order To
	Locate For Program='pos98' .And. ;
		function = 'counter2'
	If Found()
		If lockr()
			m.misc = Alltrim(Str(Val(Global.setting)))

			If Val(m.misc) > m.autohigh
				m.misc = Alltrim(Str(m.autolow))
				Replace Global.setting With ;
					alltrim(Str(Val(m.misc)+1))
			Else
				If Val(m.misc) < m.autolow
					m.misc = Alltrim(Str(m.autolow))
					Replace Global.setting With ;
						alltrim(Str(Val(m.misc)+1))
				Else
					Replace Global.setting With ;
						alltrim(Str(Val(Global.setting)+1))
				Endif
			Endif
			Unlock
		Endif
	Endif
	Select (m.headfile)

					else
						m.misc = Right(Alltrim(m.pos),8)
					endif
				Endif
			Endif
		Else
			Set Order To pos
			If Seek(m.pos)
				=stopbox('Cannot save duplicate order')
				Unlock
				Return
			Endif
		Endif
		m.balance = m.balance - m.payment + m.change
		m.fob = Time()
		Append Blank
		Gather Memvar Memo
		Unlock
		Do linesave
		Do addrun With m.balance
	Else
		=stopbox('ERROR SAVING FILE')
	Endif
Else
	If Empty(m.pos)
		=stopbox('KEYCODE INVALID')
		_Curobj = Objnum(m.pos)
		Return
	Endif
	Set Order To pos
	If Seek(m.pos)
		If m.oldkey != m.pos
			If alert('STOP','Yn',-1,-1,;
					"Record " + ;
					alltrim(m.pos)+;
					" already exists",;
					"Do you want to overwrite it?") = 'N'
				Return
			Endif
		Endif

*		m.balance = m.balance - m.payment + m.change + ;
*								(m.total - &headfile->total)
*new start
*
*	ever since you add the balance runtime update
* to the ctotal, you take the difference
* m.total - &headfile->total out because you do
* it everytime you change the total from the
* procedure ctotal instantly.
*
*
		m.balance = m.balance - m.payment + m.change
		Do changerun With pos.balance, m.balance

		Do linesave

		Select pos
		If lockr()
			Gather Memvar Memo
			Unlock
		Endif
	Else
		If alert('CAUTION','Yn',-1,-1,;
				'SAVE AS NEW RECORD') = 'Y'
			If lockf()
				Append Blank
				Gather Memvar Memo
				Unlock
				Do linesave
			Else
				=stopbox('RECORD SAVING ERROR')
			Endif
		Endif
	Endif
Endif


If m.payment > 0 .or. m.surcharge > 0
	Select Payment
	Set Order To
	If lockf()
		m.temp1=getts('payment', ;
			'payment', ;
			'getno')
		Append Blank
		Replace Payment With m.temp1
		Replace clients With m.clients

		If m.postdate = 'N'
			Replace Date With Date()
		Else
			Replace Date With pos.orderdate
		Endif

		Replace amount With (m.payment - m.change)
		Replace credit With 0
		Unlock
		Select payment2
		If lockf()
			Append Blank
			Replace Payment With m.temp1
			Replace itemcode With m.pos
			Replace itemfile With headfile
			Replace lno With 1
			Replace pay With (m.payment - m.change)
			Replace Split With m.savemethod
			Replace itemname With m.cardno
			If m.tipsmode != 'N'
				Replace surcharge2 With m.surcharge
			Endif
			Unlock
		Endif
	Endif
	Select pos
	If m.balance <= 0
		If lockr()
			If m.postdate = 'N'
				Replace post With Date()
			Else
				Replace post With pos.orderdate
			Endif
			If m.tipsmode != 'N'
				Replace surcharge With 0
				Replace chargerate With 0
			Endif
			Unlock
		Endif


		Select member
		Locate For member = m.member
		If Found()
			If lockr()
				Replace member.control1 With m.membercredit
				If m.creditrate > 0
					m.temp1xxx = m.subtotal/100*m.creditrate
				Else
					m.temp1xxx = m.subtotal
				Endif
				If !Empty(m.creditterm)
					If Alltrim(m.terms) != m.creditterm
						m.temp1xxx = 0
					Endif
					If !(Alltrim(m.via) $ m.creditvia)
						m.temp1xxx = 0
					Endif
					Replace member.control1 With member.control1 + m.temp1xxx
				Else
					Replace member.control1 With member.control1 + m.temp1xxx
				Endif
				Unlock
			Endif
		Endif
	Else
		Do rdue
	Endif
Endif

Do finalwork

Return

Procedure saveclients

if m.clients=m.automode
	return
endif

Select clients
Set Order To clients
m.clients = Alltrim(m.clients)

Select area2
Locate For itemcode = m.clients
If !Found()
	Select clients
	If Seek(m.clients)
		If lockr()
			Do sclient2
			Unlock
		Endif
	Else
		If lockf()
			Append Blank
			Do sclient2
			Unlock
		Endif
	Endif
Endif

Select member
Locate For member = m.member
If !Found()
	If lockf()
		Append Blank
		Replace member With m.member
		Unlock
	Endif
	Select pos
	Replace notepad With '*' + notepad
Endif
Return

Procedure sclient2
Select clients
Replace firstname With m.firstname, ;
	lastname With m.lastname, ;
	address1 With m.address1, ;
	address2 With m.address2, ;
	address3 With m.address3, ;
	city With m.city, ;
	state With m.state, ;
	zip With m.zip, ;
	zip4 With m.zip4, ;
	company With m.company, ;
	clients With m.clients, ;
	approved With m.approved, ;
	member With m.member
Return

Procedure finalwork

private reprint
reprint = .f.

Do holdit
Do receipt1

If Type('oldv') = 'C'
	If m.oldv = 'C'
		Return
	Endif
Endif

If !Empty(m.savecall)
	If File(Alltrim(m.progdrv)+m.savecall+'.app')
*	do alltrim(m.progdrv) + m.savecall;
*  	with .f.,'module="pos98"','','','pos98'
		=okbox('Under construction')
	Else
		=stopbox('External saving module not found')
	Endif
Endif

Do receipt2

If m.addmode
	Do receipt3
else
	if m.reprint
		Do receipt3
	endif
Endif

Return

Function allvalid
If m.warning!='N'
	If Empty(itemcode(1))
		If alert('STOP','yN',-1,-1,;
				"No item on this order", ;
				"Do you want to save it?") = 'N'
			Return .F.
		Endif
	Endif
Endif
Return

Procedure loadtable
If !OpenTable(m.datadrv,'userid')
	Cancel
Endif
If !OpenTable(m.datadrv,'scheck')
	Cancel
Endif
If !OpenTable(m.datadrv,'system')
	Cancel
Endif
If !OpenTable('.\','local')
	Cancel
Endif

* If !OpenTable(m.datadrv,'global')
* 	Cancel
* Endif

If !OpenTable('.\','opening')
	Cancel
Endif
If !OpenTable(m.datadrv,'via')
	Cancel
Endif
If !OpenTable(m.datadrv,'fob')
	Cancel
Endif
If !OpenTable(m.datadrv,headfile)
	Cancel
Endif
If !OpenTable(m.datadrv,m.linefile)
	Cancel
Endif
If !OpenTable(m.datadrv,'category')
	Cancel
Endif
If !OpenTable(m.datadrv,'catalog')
	Cancel
Endif
If !OpenTable(m.datadrv,'clients')
	Cancel
Endif
If !OpenTable(m.datadrv,'terms')
	Cancel
Endif
If !OpenTable(m.datadrv,m.headfile)
	Cancel
Endif
If !OpenTable(m.datadrv,m.linefile)
	Cancel
Endif
If !OpenTable(m.datadrv,'payment')
	Cancel
Endif
If !OpenTable(m.datadrv,'payment2')
	Cancel
Endif
If !OpenTable(m.datadrv,'method')
	Cancel
Endif
If !OpenTable(m.datadrv,'employee')
	Cancel
Endif
If !OpenTable(m.datadrv,'modifier')
	Cancel
Endif
If !OpenTable(m.datadrv,'object')
	Cancel
Endif
If !OpenTable(m.datadrv,'object2')
	Cancel
Endif

If !OpenTable(m.datadrv,'zip')
	Cancel
Endif
If !OpenTable(m.datadrv,'whatcard')
	Cancel
Endif
If !OpenTable(m.datadrv,'option')
	Cancel
Endif
If !OpenTable(m.datadrv,'profile2')
	Cancel
Endif
If !OpenTable(m.datadrv,'profile3')
	Cancel
Endif
If !OpenTable(m.datadrv,'area')
	Cancel
Endif
If !OpenTable(m.datadrv,'area2')
	Cancel
Endif
If !OpenTable(m.datadrv,'timelog')
	Cancel
Endif
If !OpenTable(m.datadrv,'break')
	Cancel
Endif
If !OpenTable(m.datadrv,'lastitem')
	Cancel
Endif
If !OpenTable(m.datadrv,'ownbook')
	Cancel
Endif
If !OpenTable(m.datadrv,'member')
	Cancel
Endif

Select Catalog
Scan For Module='pos98'
	If !Empty(Catalog.itemfile)
		If !OpenTable(m.datadrv,Catalog.itemfile)
			=okbox('Please run the catalog selection program')
			Return To Master
		Endif
	Endif
Endscan
Scan For Module='pos98'
	If !Empty(Catalog.profile)
		If !OpenTable(m.datadrv,Catalog.profile)
			=okbox('Profile error - '+Alltrim(Catalog.profile))
			Return To Master
		Endif
	Endif
Endscan
Return

Procedure plocal
If !scheck('pos98','plocal')
	Return
Endif

If Rdlevel() >= 5
	=stopbox('NOT ENOUGH MEMORY')
	Return
Endif

Do m.progdrv + 'local.exe' With .F., ;
	'program="pos98"', ;
	'','pos98',''
Return

Procedure pglobal
If !scheck('pos98','pglobal')
	Return
Endif

If Rdlevel() >= 5
	=stopbox('NOT ENOUGH MEMORY')
	Return
Endif
Do m.progdrv + 'global.exe' With .F., ;
	'program="pos98"', ;
	'','pos98',''
Return

Procedure jump
Do Case
Case _Curobj >= firstkid() .And. _Curobj <= lastkid()
	_Curobj = Objnum(m.payment)
Case _Curobj = Objnum(m.payment)
	_Curobj = Objnum(m.method)
Case _Curobj = Objnum(m.method)
	_Curobj = Objnum(m.employee)
Case _Curobj = Objnum(m.employee)
	_Curobj = Objnum(m.misc)
Otherwise
	_Curobj = firstkid()
Endcase
Return

Procedure ipref
If !scheck('pos98','pref')
	Return
Endif
If Rdlevel() >= 5
	=stopbox('NOT ENOUGH MEMORY')
	Return
Endif
Do m.progdrv + 'pref.exe' With .F., ;
	'program="pos98"', ;
	"","",'pos98'
Return

Procedure isystem
If !scheck('pos98','system')
	Return
Endif
If Rdlevel() >= 5
	=stopbox('NOT ENOUGH MEMORY')
	Return
Endif
Do m.progdrv + 'system.exe' With .F., ;
	'program="pos98"', ;
	"","",'pos98'
Return

Procedure inotepad
If !scheck('pos98','notepad')
	Return
Endif
Do Case
Case _Curobj >= firstkid() .And. ;
		_curobj <= lastkid()
	Select (m.tempalias)
	Set Order To lno
	If Seek(lno(pointer))
		Do Alltrim(m.progdrv)+'notepad.exe' With ;
			m.tempalias, 'itemname'
		itemname(pointer) = itemname
	Endif
Otherwise
	If !m.addmode
		Select (m.headfile)
		Set Order To
		Locate For pos = m.pos
		If Found()
			Do Alltrim(m.progdrv)+'notepad.exe' With ;
				headfile, 'notepad'
			m.notepad = &headfile->notepad
			Show Get m.notepad
		Endif
	Endif
Endcase
Return

Procedure lookagain
Private N, vp, temp, n2
m.temp = 0
m.vp = 1
m.n = 1
m.n2 = 0

If _Curobj >= firstkid() .And. ;
		_curobj < (lastkid() + m.itemlen)

	If !Empty(itemcode(pointer))
		m.vp = m.pointer
	Else
		If pointer > 1
			m.vp = m.pointer-1
		Else
			Return
		Endif
	Endif

	Do While .T.
		If jkey3('jbrowser',m.progdrv,;
				'modifier','content',;
				'content, content2','.t.')
			If !Empty(m.exitkey)
				If modifier.content = m.exitkey
					Exit
				Endif
			Endif
			If !Empty(m.editkey)
				If modifier.content = m.editkey
					Do lookagain4
					Exit
				Endif
			Endif
			If !Empty(m.infokey)
				If modifier.content = m.infokey
					Do line2.spr
					Do lookagain3
					Exit
				Endif
			Endif
			If !Empty(m.clearkey)
				If modifier.content = m.clearkey
					itemname(vp) = ''
					laborhour(vp) = 0
					laborcost(vp) = 0
					Do lookagain3
					Exit
				Endif
			Endif
			If m.exitkey $ modifier.content2
				itemname(vp) = Alltrim(itemname(vp)) + ;
					' ' + ;
					alltrim(modifier.content)
				itemname(vp) = Alltrim(itemname(vp))
				Show Get itemname(vp)
				Loop
			Endif

			If jkey3('jbrowser',m.progdrv,;
					'object','content',;
					'object, content, content2 width 15','.t.')
				itemname(vp) = Alltrim(itemname(vp)) + ;
					' ' + ;
					alltrim(modifier.content) + ' ' + ;
					alltrim(Object.content) + ' ' + ;
					alltrim(modifier.content2) + ;
					alltrim(Object.content2)
				itemname(vp) = Alltrim(itemname(vp))
				Show Get itemname(vp)
				If Alltrim(modifier.content) $ m.addkey
					Do lookagain2
				Endif
				Do lookagain3
			Endif
		Else
			Exit
		Endif
	Enddo
Endif
Return

Procedure lookagain3
m.temp = m.pointer
m.pointer = m.vp
Do vtempsave
Do sumext
m.pointer = m.temp
Return

Procedure lookagain4
m.temp = m.pointer
m.pointer = m.vp
Do inotepad
m.pointer = m.temp
Return

Procedure lookagain2
private n2
m.n2 = 0
if object.askunit
	Do Alltrim(m.progdrv) + 'askme.exe' With ;
		'n','How many units for ' + ;
		alltrim(itemname(vp)), m.n
endif

if object.askprice
	Do Alltrim(m.progdrv) + 'askme.exe' With ;
		'n','How much ' + ;
		alltrim(itemname(vp)), m.n2
endif

If Object.price > 0
	If m.n > 1
		itemname(vp) = itemname(vp) + ;
			'-' + Alltrim(Str(m.n))
	Endif
Endif

	laborhour(vp) = m.n
	laborcost(vp) = m.n2
	if upper(object.taxable) = 'N'
		labortax(vp) = 'N'
	endif


Return

Procedure preremote
Return

Procedure postremote
Return

Procedure itemtable
Do Alltrim(m.progdrv) + 'catalog.app' ;
	with .F.,'module="pos98"','','','pos98'
Select Catalog
Scan For Module='pos98'
	If !Empty(Catalog.itemfile)
		=OpenTable(m.datadrv,Catalog.itemfile)
	Endif
Endscan
Return

Function icodecomm
itemcode(pointer) = Alltrim(itemcode(pointer))
If m.oldv != itemcode(pointer)
	If !Empty(returndate(pointer))
		If !scheck('pos98','edititem')
			itemcode(pointer) = m.oldv
			Show Get itemcode(pointer)
			Return .F.
		Endif
	Endif
Endif

If m.cashdirect != 'N'
	If '.' $ itemcode(pointer)
		itemfile(pointer) = ''
		shipped(pointer) = 1
		price(pointer) = Val(itemcode(pointer))
		itemcode(pointer) = m.manualtext
		Do sumext
		Do tempsave
		Do ctotal
		Show Gets
		Return
	Endif
Endif

If Empty(itemcode[pointer])
	If lno(pointer) != m.maxno
		=stopbox('INVALID ITEM')
		Return .F.
	Endif
Else
	If m.oldv != itemcode[pointer]
		itemfile[pointer] = ''
	Endif
	If Empty(itemfile[pointer])
		Do itemfind
		Do sumext2
	Endif
Endif
If !Empty(itemfile[pointer])
	Do Alltrim(m.progdrv) + ;
		alltrim(itemfile(pointer))+'.app' With .F.
Endif
Do sumext
Do tempsave
Do ctotal
Do picklang2
Show Gets
Return

Procedure itemfind
Declare b(1,2)
b(1,1) = ''
b(1,2) = ''
Private i, lastfind, a
m.lastfind = ''
m.itemfindx = .T.
m.i = 0
m.a = 'Please choose from the following price book'
Select Catalog
Set Order To
Select opening
Set Order To Item
Select Catalog
Set Rela To
Set Rela To Upper(Alltrim(itemfile)+'.app') Into opening
Scan For Module = 'pos98'
	Select Alltrim(Catalog.itemfile)
	Set Order To Code
	If Seek(itemcode[pointer])
		i = i + 1
		m.lastfind = Alltrim(Catalog.itemfile)+;
			' - ' + ;
			alltrim(opening.content)
		Declare b(i)
		b(i) = m.lastfind
	Endif
Endscan
Select Catalog
Set Rela To
Do Case
Case m.i > 1
	Select profile3
	Set Order To
	Locate For via = m.via
	Set Exact Off
	If Found() .And. ;
			ascan(b,Alltrim(Upper(profile3.itemfile))) != 0
		m.lastfind = Alltrim(profile3.itemfile)
	Else

		m.lastfind = ''
		If Empty(m.lastfind)
			Do m.progdrv + 'apick.exe' With a,b,m.lastfind
			m.lastfind = Left(m.lastfind,At(' ',m.lastfind)-1)
		Endif

	Endif
	Set Exact On

	If !Empty(m.lastfind)
		itemfile[pointer] = m.lastfind
		Select (m.lastfind)
		Set Order To Code
		If Seek(itemcode[pointer])
			Do pricekid
		Else
			=stopbox('CATALOG OPENING ERROR')
		Endif
	Endif



Case m.i = 1
	m.lastfind = Left(m.lastfind,At(' ',m.lastfind)-1)
	itemfile[pointer] = m.lastfind
	Select (m.lastfind)
	Set Order To Code
	If Seek(itemcode[pointer])
		Do pricekid
	Else
		=stopbox('CATALOG OPENING ERROR')
	Endif
Otherwise
	itemfile[pointer] = ''
	m.itemfindx = .F.
	If !m.warning='N'
		=stopbox('ITEM CODE NOT FOUND')
	Endif
Endcase
Return

Procedure sumext
Private temp
m.temp = 0
If m.min1 != 'N'
	If shipped(pointer) < 1
		=stopbox('Quantity reset to 1')
		shipped(pointer) = 1
	Endif
Endif
If shipped(pointer) < 0
	shipped(pointer) = 0
	Do sumext2a
	If m.temp > 0
		shipped(pointer) = m.temp
	Endif
Endif
If m.discbyamt != 'N'
	Extended[pointer] = shipped[pointer] * ;
		price[pointer] + ;
		laborcost(pointer) * ;
		laborhour(pointer) - ;
		linedisc(pointer)

Else
	Extended[pointer] = (shipped[pointer] * ;
		price[pointer]  + ;
		laborcost(pointer) * ;
		laborhour(pointer)) * ;
		(100-linedisc[pointer]) / 100
Endif
Show Get Extended[pointer]
Do ctotal
Do vtempsave
Return

Procedure sumext2
Return

Procedure sumext2a
Do Alltrim(m.progdrv) + 'askme.exe' With ;
	'n','Quantity?',m.temp
Return


procedure ctotal0

private xxx, xxxfile

m.xxxfile = catalog.itemfile
			if m.discbyamt != 'N'
				replace extended with ;
					shipped * price + ;
					laborcost * ;
					laborhour - ;
					linedisc
			else
	  			replace extended with ;
  					(shipped*price + laborcost*laborhour) * ;
					(100-linedisc) / 100
			endif

			if !empty(&xxxfile->sort)
			  replace performby with &xxxfile->sort
			else
			  replace performby with &xxxfile->category
			endif 

			select profile2
			set order to
			if m.sort2bycat = 'N'
				locate for via = alltrim(m.via) .and. ;
					itemfile = xxxfile
			else
				locate for via = alltrim(m.via) .and. ;
					itemfile = &xxxfile->category
			endif

			select (m.tempalias)
			if found()
				replace sort1 with profile2.sort2
			endif
return

Procedure ctotal

Private subtax, subnotax, subtaxl, subnotaxl, ;
	oldtotal
m.oldtotal = m.total

*new start above 3 line

m.subtax = 0
m.subnotax = 0
m.subtaxl = 0
m.subnotaxl = 0
Select (m.tempalias)

If m.discbyamt != 'N'
	Sum shipped*price-linedisc ;
		for Upper(parttax)!='N' ;
		to m.subtax

	Sum shipped*price-linedisc ;
		for Upper(parttax)='N' ;
		to m.subnotax

	Sum laborhour*laborcost-linedisc ;
		for Upper(labortax)!='N' ;
		to m.subtaxl

	Sum laborhour*laborcost-linedisc ;
		for Upper(labortax)='N' ;
		to m.subnotaxl
Else
	Sum shipped*price*(100-linedisc)/100 ;
		for Upper(parttax)!='N' ;
		to m.subtax

	Sum shipped*price*(100-linedisc)/100 ;
		for Upper(parttax)='N' ;
		to m.subnotax

	Sum laborhour*laborcost*(100-linedisc)/100 ;
		for Upper(labortax)!='N' ;
		to m.subtaxl

	Sum laborhour*laborcost*(100-linedisc)/100 ;
		for Upper(labortax)='N' ;
		to m.subnotaxl
Endif

m.subtax = m.subtax + m.subtaxl
m.subnotax = m.subnotax + m.subnotaxl
m.nettotal = m.subtax + m.subnotax

m.subtax = Round(m.subtax * (100-m.discount)/100,2)
m.subnotax = Round(m.subnotax * (100-m.discount)/100,2)
m.subtotal = m.subtax + m.subnotax

If m.roundcents = 'N'
	m.salestax = Round(m.subtax * m.taxrate / 100,2)
Else
	If (m.subtax * m.taxrate / 100) - ;
			round(m.subtax * m.taxrate / 100,2) ;
			> 0
		m.salestax = Round(m.subtax * m.taxrate / 100,2) + 0.01
	Else
		m.salestax = Round(m.subtax * m.taxrate / 100,2)
	Endif
Endif

m.total = m.subtotal + m.salestax

*new start here
If m.oldtotal != m.total
	m.balance = m.balance - (m.oldtotal - m.total)
	Show Get m.balance
Endif
*end new start


m.surcharge = m.subtotal * m.chargerate / 100
m.afteroff = m.total

Show Get m.surcharge
Show Get m.subtotal
Show Get m.salestax
Show Get m.total
Show Get m.afteroff
Show Get m.discount

Do cdisplay
Return

Procedure ctotal2
Private temptax, ;
	tempsub, ;
	temptotal, ;
	tempb

m.tempb = m.balance
m.temptotal = m.total
m.discount = 0
Do ctotal
m.temptax = 0
m.tempsub = 0
m.temptax = m.temptotal / (100 + m.taxrate) * m.taxrate
m.tempsub = m.temptotal - m.temptax
m.discount = (m.subtotal - m.tempsub) / m.subtotal * 100
Do ctotal
If m.oldv != m.total
	m.balance = m.tempb - (m.oldv - m.total)
	Show Get m.balance
Endif
Return

Procedure upkid
Parameter What
lno[what] = &tempalias->lno
itemcode[what] = &tempalias->itemcode
itemfile[what] = &tempalias->itemfile
Title(What) = &tempalias->Title
tracking(What) = &tempalias->tracking
sort1[what] = &tempalias->sort1
sort0[what] = &tempalias->sort0
subtitle(What) = &tempalias->subtitle
itemname[what] = &tempalias->itemname
shipped[what] = &tempalias->shipped
price[what] = &tempalias->price
linedisc[what] = &tempalias->linedisc
parttax[what] = &tempalias->parttax
laborcost(What) = &tempalias->laborcost
laborhour(What) = &tempalias->laborhour
labortax(What) = &tempalias->labortax
performby(What) = &tempalias->performby
Extended(What) = &tempalias->Extended
Link(What) = &tempalias->Link
keylink(What) = &tempalias->keylink
CheckIn(What) = &tempalias->CheckIn
commission(What) = &tempalias->commission
minprice(What) = &tempalias->minprice
returndate(What) = &tempalias->returndate
cost(What) = &tempalias->cost
unit0(What) = &tempalias->unit0
name1(What) = &tempalias->name1
Return

Procedure downkid
Parameter What
Replace itemfile With itemfile[what]
Replace itemcode With itemcode[what]
Replace itemname With itemname[what]
Replace Title With Title(What)
Replace tracking With tracking(What)
Replace sort1 With sort1[what]
Replace sort0 With sort0[what]
Replace subtitle With subtitle(What)
Replace shipped With shipped[what]
Replace price With price[what]
Replace linedisc With linedisc[what]
Replace parttax With parttax[what]
Replace labortax With labortax(What)
Replace laborhour With laborhour(What)
Replace laborcost With laborcost(What)
Replace performby With performby(What)
Replace Extended With Extended(What)
Replace Link With Link(What)
Replace keylink With keylink(What)
Replace CheckIn With CheckIn(What)
Replace unit0 With unit0(What)
Replace commission With commission(What)
Replace name1 With name1(What)
Replace minprice With minprice(What)
Replace cost With cost(What)
Replace returndate With returndate(What)
Return

Procedure hidekid
Parameter What
Show Get itemcode[what] Disable
Show Get shipped[what] Disable
Show Get price[what] Disable
Show Get parttax(What) Disable
Show Get laborhour(What) Disable
Show Get laborcost(What) Disable
Show Get performby(What) Disable
Show Get linedisc(What) Disable
Show Get Extended[what] Disable
Show Get itemname[what] Disable
Show Get Title(What) Disable
Show Get tracking(What) Disable
Show Get sort1[what] Disable
Show Get sort0[what] Disable
Show Get subtitle(What) Disable
Show Get CheckIn(What) Disable
Show Get commission(What) Disable
Show Get name1(What) Disable
Show Get cost(What) Disable
Show Get minprice(What)Disable
Show Get returndate(What) Disable
Show Get unit0(What) Disable
Show Get lno(What) Disable
Return

Procedure replacekid
Parameter From,To
itemfile[from] = itemfile[to]
itemcode[from] = itemcode[to]
shipped[from] = shipped[to]
price[from] = price[to]
linedisc[from] = linedisc[to]
Extended[from] = Extended[to]
Title(From) = Title(To)
tracking(From) = tracking(To)
sort1[from] = sort1[to]
sort0[from] = sort0[to]
subtitle(From) = subtitle(To)
itemname[from] = itemname[to]
lno[from] = lno[to]
parttax(From) = parttax(To)
labortax(From) = labortax(To)
performby(From) = performby(To)
Link(From) = Link(To)
keylink(From) = keylink(To)
CheckIn(From) = CheckIn(To)
unit0(From) = unit0(To)
commission(From) = commission(To)
name1(From) = name1(To)
minprice(From) = minprice(To)
cost(From) = cost(To)
returndate(From) = returndate(To)
Return

Procedure showkid
Parameter What
Show Get itemcode[what] Enable
Show Get shipped[what] Enable
Show Get price[what] Enable
Show Get linedisc[what] Enable
Show Get itemname[what] Enable
Show Get Extended[what] Enable
Show Get parttax[what] Enable
Show Get laborcost(What) Enable
Show Get laborhour(What) Enable
Show Get labortax(What) Enable
Show Get Title(What) Enable
Show Get tracking(What) Enable
Show Get sort1[what] Enable
Show Get sort0[what] Enable
Show Get subtitle(What) Enable
Show Get performby(What) Enable
Show Get CheckIn(What) Enable
Show Get unit0(What) Enable
Show Get returndate(What) Enable
Show Get commission(What) Enable
Show Get name1(What) Enable
Show Get minprice(What) Enable
Show Get cost(What) Enable

If m._lno != 'N'
	Show Get lno(What) Enable
Endif
Return

Procedure emptykid
Parameter What
lno[what] = 0
itemfile[what]= ' '
itemcode[what]= ''
Title(What) = ' '
tracking(What) = ''
sort1[what] = ''
sort0[what] = ''
subtitle(What) = ' '
itemname[what]= ' '
price[what] = 0
shipped[what] = 1.0
linedisc[what] = 0
Extended[what] = 0
parttax[what] = ' '
labortax(What) = ''
laborcost(What) = 0
laborhour(What) = 0
performby(What) = ''
Link(What) = ''
keylink(What) = ''
CheckIn(What) = {//}
returndate(What) = {//}
commission(What) = 0
name1(What) = m.login
minprice(What) = 0
cost(What) = 0
unit0(What) = ''
Return

Procedure pricekid
cost(pointer) = cost
itemcode(pointer) = Code
itemname(pointer) = detail
Title(pointer) = Title
subtitle(pointer) = subtitle
If fieldfound('special')
	If m.terms = m.after
		price(pointer) = price
		If fieldfound('unit1')
			unit0(pointer) = unit1
		Endif
	Else
		price(pointer) = Special
		If fieldfound('unit2')
			unit0(pointer) = unit2
		Endif
	Endif
Else
	price(pointer) = price
	If fieldfound('unit1')
		unit0(pointer) = unit1
	Endif
Endif

If fieldfound('comm')
	commission(pointer) = Comm
Endif
If fieldfound('minprice')
	minprice(pointer) = minprice
Endif

performby(pointer) = category
laborcost(pointer) = laborcost
laborhour(pointer) = laborhour
labortax(pointer) = labortax
parttax(pointer) = parttax
keylink(pointer) = ''
Link(pointer) = ''
CheckIn(pointer) = {//}
returndate(pointer) = {//}
If minorder != 0
	shipped(pointer) = minorder
Endif

Select profile2
Set Order To
If m.sort2bycat = 'N'
	Locate For via = Alltrim(m.via) .And. ;
		itemfile = itemfile(pointer)
Else
	Locate For via = Alltrim(m.via) .And. ;
		itemfile = performby(pointer)
Endif

If Found()
	sort1[pointer] = profile2.sort2
Endif

Select Option
Set Order To
Locate For Upper(booklink) = Upper(itemfile(pointer)) .And. ;
	iclink = Alltrim(itemcode(pointer))
If Found()
	Select Distinct sort3 From Option Where ;
		iclink Like Alltrim(itemcode(pointer)) .And. ;
		upper(booklink)=Alltrim(itemfile(pointer)) ;
		into Array b

	For i = 1 To Alen(b)
		If jkey3('jbrowser',m.progdrv,;
				'option','howto',;
				'howto, subtitle','iclink="'+Alltrim(itemcode(pointer))+'"'+;
				' and ' + ;
				'upper(booklink)=['+Upper(Alltrim(itemfile(pointer)))+;
				'] and sort3=b['+Alltrim(Str(i))+']', ;
				'Choice ' + Alltrim(b(i)) + ' : ')
			If m.longitem != 'N'
				itemname(pointer) = Alltrim(Option.howto) + ;
									' ' + ;
									alltrim(option.subtitle) + ;
									' ' + itemname(pointer)
				Show Get Title(pointer)
				Show Get itemname(pointer)
			Else
				Title(pointer) =  Alltrim(Option.howto) + ' ' + ;
					alltrim(Title(pointer))
				subtitle(pointer) = Alltrim(Option.subtitle) + ' ' + ;
					alltrim(subtitle(pointer))
			Endif
			If Option.setprice
				Do pricekid3
			Else
				Do pricekid2
			Endif
		Endif
	Endfor
Else
	Do pricekid2
Endif

Do pricekid5

Return

Procedure pricekid5
*subclass
Return

Procedure pricekid3
If m.terms = m.after
	price(pointer) = Option.howmuch
Else
	price(pointer) = Option.Special
Endif
If Option.howmuch != Option.Special
	If m.after != m.before
		If !(Alltrim(m.terms) $ itemname(pointer))
			itemname(pointer) = Alltrim(m.terms) + ;
				'/' + ;
				alltrim(itemname(pointer))
		Endif
	Endif
Endif
Return

Procedure pricekid2
If Used(Alltrim(itemfile(pointer)))
	Select Alltrim(itemfile(pointer))
	If fieldfound('special')
		If Special != price
			If m.after != m.before
				If !(Alltrim(m.terms) $ itemname(pointer))
					itemname(pointer) = Alltrim(m.terms) + ;
						'/' + ;
						alltrim(itemname(pointer))
				Endif
			Endif
		Endif
	Endif
Endif
Return

Procedure linesave
Private lastitem
m.lastitem=''
If !m.addmode
	Do restoreme
Endif
Select (m.linefile)
Set Order To
Locate For pos = m.pos
Do While Found()
	If lockr()
		Dele
		Unlock
	Endif
	Continue
Enddo

Select (m.tempalias)
Replace All pos With m.pos
Delete All For Empty(itemcode)
Do linesave2

Set Order To lno
Go Bottom
m.maxno = lno

Select (m.linefile)
If lockf()
	Append From (m.tempalias)
	Unlock
Endif

Do linesave3

If !Empty(m.clients) .And. ;
	(m.uselast != 'N')
	select clients
	locate for clients=m.clients
	if found()

	Select lastitem
	Set Order To
	If lockf()
		Select (m.tempalias)
		Go Top
		Scan
			If price = 0
				Loop
			Endif
			Select lastitem
			Locate For clients = m.clients .And. ;
				itemcode = &tempalias->itemcode
			If !Found()
				m.lastitem=getnextno('lastitem', ;
					'lastitem', ;
					'getno')
				Append Blank
				Replace lastitem With m.lastitem
			Endif
			Replace clients With m.clients, ;
				itemcode With &tempalias->itemcode, ;
				title With &tempalias->Title, ;
				subtitle With &tempalias->subtitle, ;
				shipped With &tempalias->shipped, ;
				price With &tempalias->price, ;
				itemfile With &tempalias->itemfile, ;
				name1 With &tempalias->name1, ;
				cost With &tempalias->cost, ;
				option with &tempalias->option

			Select (m.tempalias)
		Endscan
		Unlock All
	Endif

	endif
Endif
Return

Procedure linesave2
*subclass
Replace All returndate With Date()
Return

Procedure linesave3
Select (m.tempalias)
Go Top
Scan
	If !Empty(itemfile)
		Do Alltrim(m.progdrv)+Alltrim(itemfile)+'.app' ;
			with .T., shipped, itemcode
	Endif
Endscan
Return

Procedure restoreme
Select (m.linefile)
Set Order To
Scan For pos = m.pos
	If File(Alltrim(m.progdrv)+Alltrim(itemfile)+'.app')
		Do Alltrim(m.progdrv)+Alltrim(itemfile) ;
			with .T., -shipped, itemcode
	Endif
	Select (m.linefile)
Endscan
Return

* procedure lprint
* if !empty(m.pos)
*  if _curobj >= firstkid() .and. ;
*  	 _curobj <= lastkid()
*  	if !empty(itemcode(pointer))
*			if alert('STOP','yN',-1,-1,;
*				'Print ' + alltrim(itemcode(pointer))+;
*				' ' + alltrim(title(pointer)) ) = 'Y'
*				select catalog
*				locate for module='pos98' .and.;
*					itemfile = itemfile(pointer)
*				if found()
*					do setlptn with driver
*				endif
*				select (m.tempalias)
*				set order to lno
*				seek(lno(pointer))
*				if found()
*			  	report form print1 to print noconsole next 1
*					set printer to
*				else
*				  =stopbox('Line item printing error')
*  			endif
*  		endif
*  	endif
*  endif
* endif
* return


Procedure d1item
If !scheck('pos98','editprint')
	Return
Endif

Do Case
Case _Curobj >= firstkid() .And. ;
		_curobj <= lastkid()
	Select (m.tempalias)
	Set Order To lno
	If Seek(lno(pointer))
		If really()
			Blank Field CheckIn, backorder
			CheckIn(pointer) = CheckIn
		Endif
	Endif
Endcase
Return

Procedure dcheck
Select (m.tempalias)
Set Order To lno
If Seek(lno(pointer))
	If Empty(&tempalias->returndate)
		Do deletei
		Do vtempsave
		Do sumext
	Else
		If scheck('pos98','deletei')
			Do deletei
			Do vtempsave
			Do sumext
		Endif
	Endif
Endif
Return

Function mcheck
Do Case
Case _Curobj = Objnum(shipped(pointer))
	If !Empty(returndate(pointer))
		If !scheck2('pos98','editqty')
			Return .F.
		Endif
	Endif
Case _Curobj = Objnum(unit0(pointer))
	If !scheck2('pos98','editunit')
		Return .F.
	Endif
Case _Curobj = Objnum(price(pointer))
	If price = 0
		Return .T.
	Endif
	If !scheck2('pos98','editprice')
		Return .F.
	Endif
Case _Curobj = Objnum(linedisc(pointer))
	If !scheck2('pos98','linedisc')
		Return .F.
	Endif
Case _Curobj = Objnum(m.discount) .Or. ;
		_curobj = Objnum(m.total)
	If !scheck2('pos98','editdisc')
		Return .F.
	Endif
Case _Curobj = Objnum(m.off)
	If m.membercredit <= 0
		Return .F.
	Endif
Case _Curobj = Objnum(m.taxrate)
	If !scheck2('pos98','edithead')
		Return .F.
	Endif
Case _Curobj >= firstkid() .And. ;
		_curobj <= lastkid() .And. ;
		_curobj != Objnum(linedisc(pointer))
	If !Empty(returndate(pointer))
		If !scheck2('pos98','edititem')
			Return .F.
		Endif
	Endif
Endcase
Return .T.

Procedure Auto
If Readkey() != 4
	If m.autotable != 'N'
		If Empty(itemcode(pointer))
			If Lastkey() != 27
				Do Table
				If Lastkey() = 27
					m.autotable = 'N'
				Endif
			Endif
		Endif
	Endif
	Return
Endif

Procedure checkme
If !scheck2('pos98','checkall')

	If jkey3('jbrowser',m.progdrv,;
			headfile,m.checkorder,;
			'misc:h=[No.],balance,clients',;
			'empty(post) .and. employee=['+m.login+']')
		Do loadkid With &headfile->pos, 'pos'
		m.oldkey = m.pos
	Endif

Else

	If Alltrim(Upper(byserver)) = 'V'
		If jkey3('jbrowser',m.progdrv,;
				'via','via',;
				'via','.t.')
			m.x = Alltrim(via.via)
			If jkey3('jbrowser',m.progdrv,;
					headfile,m.checkorder,;
					'misc:h=[No.],balance,clients',;
					'empty(post) .and. via=['+m.x+']')
				Do loadkid With &headfile->pos, 'pos'
				m.oldkey = m.pos
			Endif
		Endif
		Return
	Endif

	If m.byserver != 'N'
		If jkey3('jbrowser',m.progdrv,;
				'userid','userid',;
				'userid','.t.')
			m.x = Alltrim(Userid.Userid)
			If jkey3('jbrowser',m.progdrv,;
					headfile,m.checkorder,;
					'misc:h=[No.],balance,clients',;
					'empty(post) .and. employee=['+m.x+']')
				Do loadkid With &headfile->pos, 'pos'
				m.oldkey = m.pos
			Endif
		Else
			If jkey3('jbrowser',m.progdrv,;
					headfile,m.checkorder,;
					'misc:h=[No.],balance,clients,via,employee',;
					'empty(post)' )
				Do loadkid With &headfile->pos, 'pos'
				m.oldkey = m.pos
			Endif
		Endif
	Else
		If jkey3('jbrowser',m.progdrv,;
				headfile,m.checkorder,;
				'misc:h=[No.],balance,clients,via,employee',;
				'empty(post)' )
			Do loadkid With &headfile->pos, 'pos'
			m.oldkey = m.pos
		Endif
	Endif
Endif
Return


Procedure zeroitem
If !scheck('pos98','zeroitem')
	Return
Endif
If _Curobj >= firstkid() .And. ;
		_curobj <= lastkid()
	If !Empty(itemcode(pointer))
		price(pointer) = 0
		laborcost(pointer) = 0
		Do vtempsave
		Do sumext
		Show Gets
	Else
		If pointer > 1
			price(pointer-1) = 0
			laborcost(pointer-1) = 0
			pointer = pointer - 1
			Do vtempsave
			Do sumext
			pointer = pointer + 1
			Show Gets
		Endif
	Endif
Endif
Return

Procedure startinit
If !Empty(m.initprg) .And. Wexist('pos98')
	If File(m.progdrv + m.initprg)
		Do savekid With 'pos98'
		Do Alltrim(m.progdrv) + m.initprg With .T.,'.t.',m.oldv,m.areafrom
		Do restorekid With 'pos98'
		m.clients = Alltrim(m.oldv)
		If Alltrim(Upper(m.clients)) = Alltrim(Upper(m.exitkey))
			m.clients = ''
			m.loopinit = .T.
			m.login = ''
			m.j=.F.
			Return
		Endif
		Do startinit2
		If !Empty(m.clients)
			Select pos
			Set Order To
			Locate For clients = m.clients .And. Empty(post)
			If Found()
				If !scheck2('pos98','lookup')
					If Alltrim(pos.employee) != Alltrim(m.login)
						Do login2
						If Alltrim(m.login) != pos.employee
							=stopbox('Cannot load ' + ;
								alltrim(pos.employee) + ' table')
							Do restorekid With 'pos98'
							m.j = .T.
							Return
						Endif
					Endif
				Endif
				Do loadkid With &headfile->pos, 'pos'
				m.oldkey = m.pos
			Else
				If Used(areafile)
					Select (areafile)
					Set Order To
					Locate For itemcode = m.oldv
					If Found()
						If !Empty(&areafile->who)
							m.employee = Alltrim(&areafile->who)
						Endif
					Endif
				Endif
			Endif
		Endif
		Do refreshkid
	Endif
Endif
Return


Procedure startinit2
If !Empty(m.clients)
	Select via
	Locate For Alltrim(Upper(via)) = Alltrim(Upper(m.clients))
	If Found()
		m.via = via
		m.clients = m.automode
	Else
		m.via = Alltrim(m.initvia)
	Endif
Endif
Return

Procedure getmember
If Empty(m.askmember)
	If Empty(m.member)
		Do Alltrim(m.progdrv) + 'askme.exe' With ;
			'c','VIP Member Id?',m.member
		If !Empty(m.mid) .And. Upper(Left(m.member,1)) = m.mid
			m.member = Substr(m.member,2)
		Endif
		If !Empty(m.member)
			Do getcredit
		Endif
	Endif
Endif
Return

Procedure getcompany
If !Empty(m.askcompany)
	If Alltrim(m.via) $ Alltrim(m.askcompany)
		If Empty(m.company)
			Do Alltrim(m.progdrv) + 'askme.exe' With ;
				'c','How many people?',m.company
			_Curobj = _Curobj + 1
		Endif
	Else
		Return .F.
	Endif
Else
	If Empty(m.company)
		Do Alltrim(m.progdrv) + 'askme.exe' With ;
			'c','How many people?',m.company
	Endif
Endif
Return

Procedure getemp
If !Empty(m.askemploy)
	If Alltrim(m.via) $ Alltrim(m.askemploy)
		If m.employee='*'
			Return .F.
		Else
			If Empty(m.employee)
				If jkey3('jbrowser',m.progdrv,;
						'userid','userid',;
						'userid','.t.')
					m.employee = Userid.Userid
					Show Get m.employee
				Endif
			Endif
		Endif
	Else
		Return .F.
	Endif
Else
	If m.employee='*'
		Return .F.
	Else
		If Empty(m.employee)
			If jkey3('jbrowser',m.progdrv,;
					'userid','userid',;
					'userid','.t.')
				m.employee = Userid.Userid
				Show Get m.employee
			Endif
		Endif
	Endif
Endif
Return

Procedure getclients
Do getclient1
Do getclient2
Do cv
If !Empty(m.automode)
	If Alltrim(m.clients) = m.automode .and. ;
		empty(m.via)
		m.via = Alltrim(m.autovia)
	Endif
Endif
If Empty(m.clients)
	Return
Endif
If Empty(m.via)
	Select Alltrim(via) + ' ' + Alltrim(via2) From via Into Array b
	If Type('b') = 'C'
		Do m.progdrv + 'apick.exe' With ;
			'Please select transaction',b,m.via
		m.via = Alltrim(m.via)
		Select via
		Set Order To
		Locate For Alltrim(via) $ m.via
		If Found()
			m.via = Alltrim(via.via)
		Endif
	Endif
Endif

If !Empty(m.askc2) .And. m.addmode
	If Alltrim(m.via) $ Alltrim(m.askc2)
		If Alltrim(m.clients) = Alltrim(m.automode)
			m.clients = ''
		Endif
		Do custinfo.spr
		If Empty(m.clients)
			m.clients = Alltrim(m.automode)
		Else
			Do saveclients
		Endif
	Endif
Endif
Return

Procedure getclient1
Return

Procedure getclient2
If Empty(m.clients)
	Do Alltrim(m.progdrv) + 'askme.exe' With ;
		'c',Alltrim(m.m0) + Alltrim(m.automode) + ;
		' = ' + Alltrim(m.autovia) ,m.clients
Endif
Return

Procedure getmisc
If m.checkno != 'N'
	If Empty(m.misc)
		Do Alltrim(m.progdrv) + 'askme.exe' With ;
			'c','Check No?',m.misc
	Endif
	If Empty(m.misc)
		m.misc = ' '
	Endif
Endif
Return


Function v
Private m.who
m.who = ''
If m.lookupmode
	Return
Endif
If !scheck2('pos98','quit')
	If scheck2('pos98','logout')
		If alert('STOP','Yn',-1,-1,;
				"do you want to logout?") = 'Y'
			If !Empty(m.greeting)
				Do Alltrim(m.progdrv) + 'display.app' ;
					with .F.,'CLOSED'
			Endif
			m.login = ''
			Do Init
		Endif
		Return .F.
	Else
  		=stopbox('INVALID ACCESS CODE')
		Return .F.
	Endif
Else
	If alert('STOP','Yn',-1,-1,;
			"do you want to logout?") = 'Y'
		m.who = m.login
		m.login = ''
		If !Empty(m.greeting)
			Do Alltrim(m.progdrv) + 'display.app' ;
				with .F.,'CLOSED'
		Endif

		If alert('STOP','yN',-1,-1,;
				"do you want to quit?") = 'Y'
			m.login = m.who
			Return .T.
		Else
			Do Init
			Return .F.
		Endif
	Else
		Return .F.
	Endif
Endif


Procedure receipt1
Parameter lookupmode
If Parameters() = 0
	m.lookupmode = .F.
Endif
If !Empty(m.saveprint)
	If Type('oldv') != 'C'
		m.oldv = 'Y'
	Endif
	If m.oldv != 'Y' .And. !m.lookupmode
		Return
	Endif
	If File(Alltrim(m.progdrv)+m.saveprint+'.app')
		Do Alltrim(m.progdrv) + m.saveprint With .T.,'','',m.pos
	Else
		=stopbox('Printing module not found')
	Endif
Endif
Return

Procedure holdit

Private aflag, eflag
m.aflag = .F.
m.eflag = .F.


*
* if you don't want to print all at once, say default 'N'
* you have to come back and reprint the item which has
* a backorder on it.
* for faster operation, leave it to empty so
* cook can pick up faster
*

If m.printat1 = 'N'
	Select(m.tempalias)
	Locate For (backorder = 1)
	If Found()
		If alert('?','Yn',-1,-1,;
				'Ready for main') = 'Y'
			Replace All CheckIn With {//}, ;
				backorder With 0 For ;
				(backorder = 1)
			Select (m.linefile)
			Replace All CheckIn With {//}, ;
				backorder With 0 For ;
				(backorder = 1) .And. ;
				(pos = m.pos)
		Endif
	Endif
Endif

If Alltrim(m.via) $ m.holdvia
	Select (m.tempalias)
	Scan
		If (Alltrim(performby) $ m.holdcat) .And.;
				empty(CheckIn)
			m.aflag = .T.
		Else
			If Empty(CheckIn)
				m.eflag = .T.
			Endif
		Endif
		If m.aflag And m.eflag
			Exit
		Endif
	Endscan

	If m.aflag And m.eflag
		If alert('?','Yn',-1,-1,;
				'Hold for main') = 'Y'
			Select (m.linefile)
			Scan For pos = m.pos
				If !(Alltrim(performby) $ m.holdcat) .And. ;
						empty(CheckIn)
					If lockr()
						Replace backorder With 1
						If m.printat1 = 'N'
							Replace CheckIn With Date()
						Endif
						Unlock
					Endif
				Endif
			Endscan
		Endif
	Endif

Endif

Return

Procedure receipt2
If Alltrim(m.via) $ m.asknotice2 .Or. Empty(m.asknotice2)
	Select (m.tempalias)
	Locate For Empty(CheckIn)
	If Found()
		if !m.addmode
			m.reprint = .t.
		endif
		If !Empty(m.saveprint2)
			If m.autor = 'N'
				If alert('?','Yn',-1,-1,;
						'Print new entries') = 'N'
					Return
				Endif
			Endif

			If File(Alltrim(m.progdrv)+m.saveprint2+'.app')
				Do Alltrim(m.progdrv) + m.saveprint2 With ;
					.T.,'','',m.pos,'pos98'
				Select (m.linefile)
				Set Order To
				If lockf()
					Replace All CheckIn With Date() ;
						for pos = m.pos
					Unlock
				Endif
			Else
				=stopbox('Printing module not found')
			Endif
		Endif
	Endif
Endif
Return

Procedure receipt3
If Alltrim(m.via) $ m.asknotice

	If !Empty(m.saveprint3)

		If m.autor = 'N'
			If alert('?','Yn',-1,-1,;
					'Notice') = 'N'
				Return
			Endif
		Endif

		If File(Alltrim(m.progdrv)+m.saveprint3+'.app')
			Do Alltrim(m.progdrv) + m.saveprint3 With ;
				.T.,'','',m.pos, m.reprint
		Else
			=stopbox('Printing module not found')
		Endif

	Endif

Endif
Return

Procedure cv
Private who
m.who = ''
If !Empty(m.clients) .And. m.addmode
	Select area2
	Set Order To
	m.who = Strtran(m.clients,m.automode,'')
	Locate For itemcode=Alltrim(m.who)
	If !Found()
		Do rclients
	Else
		m.via = m.initvia
	Endif
	Select pos
	Set Order To
	Locate For clients = Alltrim(m.clients) .And. ;
		empty(post) .And. ;
		empty(duedate) .and. ;
		register = m.register

	If Found()
		If !scheck2('pos98','lookup')
			If pos.employee != m.login
				=okbox('Cannot load '+ Alltrim(pos.employee) + ' order')
				m.clients = ''
				_Curobj = Objnum(m.clients)
				Show Get m.clients
				Return
			Endif
		Endif
		Do loadkid With &headfile->pos, 'pos'
		m.oldkey = m.pos
	Endif
Endif
Return

Procedure rclients
Select clients
Set Order To

If !Empty(m.mid) .And. Left(m.clients,1) = m.mid
	m.member = Substr(m.clients,2)
	m.clients = ''
	Locate For member = m.member
Else
	Locate For clients = m.clients
Endif

If Found()
	m.clients = clients.clients
	Do rclients3
Else
	m.taxrate = Val(getlocal('pos98','taxrate'))
	If m.clicheck != 'N' .and. ;
		m.clients != m.automode
		m.oldv = ''
		Do m.progdrv+'clients.app' With .T.,'.t.',m.clients,'',Alltrim(m.clients)
		If m.oldv != m.clients
			m.clients = clients.clients
			Do rclients3
		Endif
	Endif
Endif

Do rclients2
Return

Procedure rclients2
Return

Procedure rclients3
m.firstname = clients.firstname
m.lastname = clients.lastname
m.address1 = clients.address1
m.address2 = clients.address2
m.address3 = clients.address3
m.approved = clients.approved
m.city= clients.city
m.state = clients.state
m.zip = clients.zip
m.zip4 = clients.zip4
m.member = clients.member
Do termsv
If !Empty(clients.taxexempt)
	m.taxrate = 0
else
	m.taxrate = Val(getlocal('pos98','taxrate'))
Endif
Do ctotal

Show Get m.approved
Show Get m.firstname
Show Get m.lastname
Show Get m.address1
Show Get m.address2
Show Get m.address3
Show Get m.city
Show Get m.state
Show Get m.zip
Show Get m.zip4
Show Get m.clients
Show Get m.member
If approved
	Do Alltrim(m.progdrv)+'notepad.exe' With ;
		'clients', 'notepad'
Endif

Do getcredit
Return

Procedure house
If !scheck('pos98','edithead')
	Return
Endif

m.oldv = m.clients
Do m.progdrv+'clients.app' With .T.,'.t.',m.clients,'',''
If m.oldv != m.clients
	m.clients = clients.clients
	Do rclients
Endif
Do rdue
Return


Procedure rdue
If m.askduedate != 'N'
	Do Alltrim(m.progdrv)+'askme.exe' With 'D', ;
		'Please enter the Duedate', m.duedate
	If !m.addmode
		Select pos
		Set Order To
		Locate For pos = m.pos
		If Found()
			If lockr()
				Replace duedate With m.duedate
				Unlock
			Endif
		Endif
	Endif
Endif
Return

Procedure openss
If !Empty(m.cashdrawer)
	Copy File cg. To &cashdrawer
Endif
Return

Procedure paynow
Select whatcard
Set Order To whatcard
Set Sysm Off
If Seek(m.method)
	If m.autocard = 'N'
		Do paynow2
	Endif
	m.surcharge = m.change
	m.change = 0
	m.payment = m.payment - m.surcharge
Else
	Do openss
Endif

Set Sysm Auto
Do Save
If m.oldv = 'C'
	_Curobj = Objnum(m.payment)
	m.payment = 0
	m.method = ''
	m.surcharge = 0
	m.change = 0
Endif
Return

Procedure paynow2
Do Alltrim(m.progdrv)+'askme.exe' With 'C', ;
	'Please enter the credit card number', m.cardno
Return

Procedure cdisplay
If !Empty(m.greeting)
	Do Alltrim(m.progdrv) + 'display.app' ;
		with .F.,'Total : ' + ;
		alltrim(Str(m.total-m.off,10,2))
Endif
Return

Function payv
private what, howmanym
m.what = ''
m.howmanym = 0

If m.payment = 0
	if m.balance > 0 
		Return
	else
		select payment2
		locate for itemcode = m.pos
		do while found()
			m.what = payment2.split
			select method
			locate for method = m.what
			skip 1
			if eof()
				go top
			endif
			wait window 'Payment change from ' + ;
						alltrim(m.what) + ' to ' + ;
						alltrim(method.method)
			m.what = method.method
			select payment2
			if lockr()
				replace split with m.what
				unlock			
			endif
			select payment2
			continue
		enddo
		do init
		return
	endif
Endif

If m.payment > 0
	If !scheck2('pos98','partial')
		If m.payment < m.balance
			m.payment = 0.00
			=stopbox('Payment not valid')
			Return .F.
		Endif
	Endif
	If !scheck('pos98','cashier')
		=stopbox('Invalid cashier code - reset to 0.00 ')
		m.payment = 0
		Show Get m.payment
		Return .F.
	Endif
	if m.payment < m.balance 
  		m.method = m.splitkey
  		m.promptr1 = ''
	endif
Else
	m.oldv = m.total
	m.total = m.total + m.payment
	m.payment = 0
	Do ctotal2
	_Curobj = Objnum(m.payment)
	m.oldv = ''
	Return
Endif

If m.addmode
	If m.payment > m.total
		m.change = m.payment - m.total
	Else
		m.change = 0
	Endif
	Show Get m.change
Else
	If m.payment > m.balance
		m.change = m.payment - m.balance
	Else
		m.change = 0
	Endif
	Show Get m.change
Endif

If m.payment > 0
	If m.balance = 0 .And. !m.addmode
		If alert('STOP','yN',-1,-1,;
				'Zero balance on this order',;
				'Do you still want a payment?') != 'Y'
			m.payment = 0
			Show Get m.payment
			Return .F.
		Endif
	Endif

	If methodv()
		Select method
		go top
		m.howmanym = reccount()
		if m.howmanym <= 1
			m.method = method.method
		else
			if empty(m.method) .or. (m.method = m.splitkey)
				Do payv2
				if empty(m.method)
				  return
				endif
			endif
		endif		
		do paynow
	Endif

Endif
Return .T.

Procedure payv2
private temp

if left(m.method,1) = m.splitkey
  m.temp=alphanum(m.method,'Aa')
  if !empty(m.temp)
	  select method
	  locate for method = m.temp
	  if found()
    	do paynow
	    return
	  endif
  endif
endif

If jkey3('jbrowser',m.progdrv,;
		'method','method',;
		'method','.t.')
	if m.method = m.splitkey
	  m.method = m.splitkey + alltrim(method.method)
	else
	  m.method = method.method
	endif
	Show Get m.method
Else
	_Curobj = Objnum(m.payment)
Endif
Return


procedure tvia
select via
set order to
locate for via=m.via
if eof()
  go top
else
  skip 1
endif
m.via = via.via
Show Get m.via
return


Procedure tterms

If _Curobj >= firstkid() .And. ;
		_curobj <= lastkid()

	If !Empty(returndate(pointer))
		If !scheck('pos98','edititem')
			Return
		Endif
	Endif

	If !Empty(itemcode(pointer)) .And. ;
			!Empty(itemfile(pointer))

		Select Alltrim(itemfile(pointer))
		If !fieldfound('special')
			Return
		Endif

		If Used(Alltrim(itemfile(pointer)))
			Select Option
			Set Order To
			Locate For Upper(booklink) = Upper(itemfile(pointer)) .And. ;
				iclink = Alltrim(itemcode(pointer))
			If Found() .And. Option.setprice
				If Option.howmuch != Option.Special
					Do Case
					Case price(pointer)=howmuch
						price(pointer) = Special
						itemname(pointer) = Strtran(itemname(pointer), ;
							alltrim(After), ;
							'')
						itemname(pointer) = itemname(pointer) + Alltrim(m.before)

					Case price(pointer)=Special
						price(pointer) = 0
						itemname(pointer) = Strtran(itemname(pointer), ;
							alltrim(Before), ;
							'')
						itemname(pointer) = itemname(pointer) + Alltrim(m.m00)
					Case price(pointer)=0
						price(pointer) = howmuch
						itemname(pointer) = Strtran(itemname(pointer), ;
							alltrim(m.m00), ;
							'')
						itemname(pointer) = itemname(pointer) + Alltrim(m.after)
					Endcase

*						if price(pointer) = howmuch
*							price(pointer) = special
*							itemname(pointer) = strtran(itemname(pointer), ;
*																	alltrim(after), ;
*																	alltrim(m.before))
*						else
*							price(pointer) = howmuch
*							itemname(pointer) = strtran(itemname(pointer), ;
*																	alltrim(before), ;
*																	alltrim(m.after))
*						endif

				Endif
			Else
				Select Alltrim(itemfile(pointer))
				Set Order To
				Locate For Code = itemcode(pointer)
				If Found()
					If price != Special

						Do Case
						Case price(pointer)=price
							price(pointer) = Special
							itemname(pointer) = Strtran(itemname(pointer), ;
								alltrim(After), ;
								'')
							itemname(pointer) = itemname(pointer) + Alltrim(m.before)
						Case price(pointer)=Special
							price(pointer) = 0
							itemname(pointer) = Strtran(itemname(pointer), ;
								alltrim(Before), ;
								'')
							itemname(pointer) = itemname(pointer) + Alltrim(m.m00)
						Case price(pointer)=0
							price(pointer) = price
							itemname(pointer) = Strtran(itemname(pointer), ;
								alltrim(m.m00), ;
								'')
							itemname(pointer) = itemname(pointer) + Alltrim(m.after)
						Endcase


*						if price(pointer) = price
*							price(pointer) = special
*							itemname(pointer) = strtran(itemname(pointer), ;
*																	alltrim(after), ;
*																	alltrim(m.before))
*						else
*							price(pointer) = price
*							itemname(pointer) = strtran(itemname(pointer), ;
*																	alltrim(before), ;
*																	alltrim(m.after))
*						endif

					Endif
				Endif
			Endif
			Do vtempsave
			Do sumext
			Show Get price(pointer)
			Show Get itemname(pointer)
			Return
		Endif
	Endif

Endif

If m.terms = m.before
	m.terms = m.after
Else
	m.terms = m.before
Endif
Show Get m.terms
Return

Function empw
If !scheck2('pos98','edithead')
	Return .F.
Endif
If !scheck2('pos98','editname')
	Return .F.
Endif
Do getemp
Return

Function empv
If m.idcheck != 'N'
	If Empty(m.employee)
		=stopbox('Please enter your employee id')
		Return 0
	Endif
Endif
Return

Function cliw
If !scheck2('pos98','edithead')
	Return .F.
Endif
Return

Function cliv
Do cv
Return

Function viaw
If !scheck2('pos98','edithead')
	Return .F.
Endif

If Empty(m.via)
	Do Table
Endif
Return .T.

Function comw
If !scheck2('pos98','edithead')
	Return .F.
Endif
Do getcompany
Return

Function miscw
If !scheck2('pos98','edithead')
	Return .F.
Endif
Return

Function miscv
If m.checkno != 'N'
	If Empty(m.misc)
		=stopbox('Enter Receipt No.')
		Return .F.
	Endif
Endif
Return


Function paymentw
If m.applycash != 'N'
	m.payment = m.total
Endif
Return

Function methodv
If !Empty(m.method) .and. left(m.method,1)!=m.splitkey
	Select method
	Set Order To method
	If !Seek(m.method)
		=stopbox('Method of payment not registered')
		Return 0
	Endif
Endif
Return

Function chav
If m.oldv != m.chargerate
	m.surcharge = m.subtotal * chargerate / 100
	Show Get m.surcharge
Endif
m.oldv = ''
Return

Function appv
If Lastkey() = 13
	m.approved = !m.approved
	Show Get m.approved
Endif
If m.approved
	If !Empty(m.clients)
		Select clients
		Set Order To clients
		If Seek(m.clients)
			Do Alltrim(m.progdrv)+'notepad.exe' With ;
				'clients', 'notepad'
			Replace clients.approved With .T.
		Endif
	Endif
Else
	If !Empty(m.clients)
		Select clients
		Set Order To clients
		If Seek(m.clients)
			Replace clients.approved With .F.
		Endif
	Endif
Endif
Return

Procedure resetall
If !scheck('pos98','editprint')
	Return
Endif
Select (m.tempalias)
Blank All Fields CheckIn, backorder
Do linesave
Do loadkid With m.pos, 'pos'
Return

Procedure pr
If !scheck('pos98','lookup')
	Return
Endif
Do previous With 'pos','pos'
If !Bof(m.headfile)
	Do loadkid With pos.pos, ;
		'pos'
Endif
Return

Procedure nr
If !scheck('pos98','lookup')
	Return
Endif

Do Next With 'pos','pos'
If !Eof(m.headfile)
	Do loadkid With pos.pos, ;
		'pos'
Endif
Return

Procedure fr
If !scheck('pos98','lookup')
	Return
Endif
Do First With 'pos','pos'
If !Bof(m.headfile)
	Do loadkid With pos.pos, ;
		'pos'
Endif
Return

Procedure lr
If !scheck('pos98','lookup')
	Return
Endif
Do Last With 'pos','pos'
If !Eof(m.headfile)
	Do loadkid With pos.pos, ;
		'pos'
Endif
Return

Procedure loginp
Do login2
m.misc2 = m.misc2 + ' ' + m.login
m.misc2 = Alltrim(m.misc2)
If m.addmode .And. Empty(m.employee)
	m.employee = m.login
	Show Get m.employee
Endif
Do selectm
Return

Procedure Autosave
If _Curobj != Objnum(m.payment)
	if _curobj = objnum(m.total)
		if m.oldv != m.total
			do ctotal2
		endif
		m.oldv = ''			
	endif
	_Curobj = Objnum(m.payment)

Else
	Do autosave2
Endif
Return

Procedure autosave2
Private temp1, temp2, temp3, temp4

m.temp2 = .T.
m.temp1 = ''
m.temp4 = ''

*	if m.payment = 0

m.payment = 0
m.cardno = ''

* m.method = ''


Do While m.temp2
	m.temp1 = 'Tender Amount ' + ;
		alltrim(Str(m.balance,10,2)) + ;
		iif(!Empty(Alltrim(m.splitkey)), ;
		' - '+Alltrim(m.splitkey)+ ' for split tender' ;
		,'') + ;
		iif(!Empty(Alltrim(offkey)), ;
		' - ' + Alltrim(m.offkey) + ' for coupon','')

	Do autosave2a

	m.cardno = Alltrim(m.cardno)
	m.temp2 = .F.
	
	if empty(m.cardno) .and. balance > 0
		temp4=alert('CAUTION','Ync',-1,-1,;
				'Credit Card')
		if temp4 = 'Y'
			m.cardno = alltrim(str(m.balance,8,2))
			if left(m.method,1) != m.splitkey
			  m.method = 'Credit'
			else
			  m.method = m.splitkey + 'Credit'
			endif
		endif	
		if temp4 = 'C'
		  return
		endif		
	endif

	If !Empty(m.splitkey)
		If Alltrim(m.splitkey) + Alltrim(m.splitkey) = Alltrim(m.cardno)
			m.payment = m.total
			=payv()
			Return
		Endif
	Endif

	If !Empty(m.offkey)
		If Alltrim(m.offkey) = Alltrim(m.cardno)
			Do autosave2b
			m.cardno = ''
			m.temp2 = .T.
		Endif
	Endif

	If !Empty(m.setpaykey)
		If Alltrim(m.setpaykey) = Alltrim(m.cardno)
			Do setpayment
			m.cardno = ''
			m.temp2 = .T.
		Endif
	Endif

Enddo

if !empty(m.splitkey)
	if alltrim(m.cardno) = m.splitkey
		Do tablef2
		Do Save
		Return
	endif		
endif

If m.cardi $ m.cardno
	Do Alltrim(progdrv) + 'icverify.app' ;
		with .T.,'.t.',m.cardresult
	If !Empty(m.cardresult)
		m.payment = 0
		m.method = ''
		Show Get m.payment
		Show Get m.method
		m.cardresult = ''
	Else
		m.cardresult = ''
	Endif
Else
	If Empty(m.cardno) .and. m.balance > 0
		If !scheck2('pos98','partial')
			return .f.
		else			
			Do Save
		endif			
	Else
		m.payment = Val(m.cardno)
		=payv()
	Endif
Endif

*	else
*		if !payv()
*		  return
*		endif
*	endif

Return

Procedure autosave2a
Do Alltrim(m.progdrv) + 'askme.exe' With ;
	'c',alltrim(m.temp1),m.cardno, m.confirm
Return

Procedure autosave2b
Private temp3
temp3 = 0
Do Alltrim(m.progdrv) + 'askme.exe' With ;
	'n','Enter the coupon amount',m.temp3

m.total = m.total - temp3
Do ctotal2
m.note=m.note + Alltrim('coupon : ' + Str(temp3,8,2))

Return

Procedure selectm
If !scheck2('pos98','fullmenu')
	If Language != 'N'
		Do Half.mpr
	Else
		Do halfc.mpr
	Endif
Else
	If Language != 'N'
		Do pos98.mpr
	Else
		Do pos98c.mpr
	Endif
Endif
Return

Procedure checktl
Private whatdate
m.whatdate = Iif( (Val(Sys(2)) < 3600 * m.starthour + ;
	60 * m.startmin),Date()-1,Date())
If m.timelog != 'N'
	Select timelog
	Set Order To
	Locate For Userid = m.login .And. ;
		datein = m.whatdate .And. ;
		empty(Timeout)
	If !Found()
		Do Alltrim(m.progdrv) + 'timelog.app' With .T.
		m.oldv2 = 'restart'
	Endif
Endif
Return

Procedure homekey
If _Curobj != firstkid()
	_Curobj = firstkid()
Else
	Do AddLine
Endif

Return

Procedure termsv
Select terms
Set Order To
Locate For terms = m.terms
If Found()
	Do Case
	Case terms.Sort <= 1
		m.duedate = m.orderdate + terms.duedays
	Case terms.Sort = 2
		m.duedate = fom(Gomonth(m.orderdate,forwardm)) + Dayofmonth - 1
	Case terms.Sort = 3
		m.duedate = m.orderdate + (forwardw*7)
		If Dow(duedate) > terms.Dayofweek
			m.duedate = m.duedate - (Dow(duedate) - terms.Dayofweek)
		Else
			m.duedate = m.duedate + (terms.Dayofweek - Dow(duedate))
		Endif
	Endcase

	m.discdate = m.orderdate + terms.discdays
	m.discper = terms.discper
	m.deliveryon = Date() + terms.deliveryin
	Show Get m.discdate
	Show Get m.discper
	Show Get m.duedate

Endif
Return

Procedure addrun
Parameter howmuch
If !Empty(m.clients)
	Select clients
	Set Order To
	Locate For clients = m.clients
	If Found()
		If lockr()
			Replace runbalance With runbalance + howmuch
			Unlock
		Endif
	Endif
Endif
Return

Procedure changerun
Parameter ov, nv
If !Empty(m.clients)
	Select clients
	Set Order To
	Locate For clients = m.clients
	If Found()
		If lockr()
			Replace runbalance With (runbalance - m.ov)
			Replace runbalance With (runbalance + m.nv)
			Unlock
		Endif
	Endif
Endif
Return

Procedure setpayment
If !Empty(m.pos)
	Select Payment
	Set Order To
	If !lockf()
		Return
	Else
		Select payment2
		Set Order To
		If !lockf()
			Return
		Endif
	Endif
	Scan For itemcode = m.pos
		Select Payment
		Delete All For Payment = payment2.Payment
		Select payment2
		Delete
	Endscan
	Unlock All
	m.off = 0
	m.afteroff = 0
	m.balance = m.total
	Do save2
Endif
Return

Procedure midc
If !Empty(m.mid) .And. Upper(Left(m.member,1)) = m.mid
	m.member = Substr(m.member,2)
Endif
Return

Procedure getcredit
If !Empty(m.member)
	Select member
	Locate For member = Alltrim(m.member)
	If Found()
		m.membercredit = member.control1
		Show Get membercredit
	Endif
Endif
Return


Procedure login2
If m.touchscreen
	Do Alltrim(m.progdrv) + 'login2.exe' With .F.,'',.T.
Else
	Do Alltrim(m.progdrv) + 'login2.exe' With .F.,'',.F.
Endif
Return

Procedure startloc
_Curobj = firstkid()
Return

function v2

	If scheck2('pos98','delete')
		return .t.
	endif

if m.addmode .and. m.balance > 0
  return .f.
endif

	close database

	if file('exit1.bat')
	  !exit1
	endif
	if !empty(exitprg)
		if file(exitprg)
		  do (exitprg)
		  wait window 'good bye'
		else
		  wait window
		endif
	else
		wait window
	endif

	  do loadtable

	If scheck2('pos98','logout')
		if lastkey() = 13
			If !Empty(m.greeting)
				Do Alltrim(m.progdrv) + 'display.app' ;
					with .F.,'CLOSED'
			Endif
			m.login = ''
		endif
	endif

	  do init
	  return .f.
return