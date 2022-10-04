external array lno, itemcode, name1

if !empty(m.prekey) .and. ;
		m.lookupmode
	select (m.headfile)
	set order to pos
	if seek(m.prekey)
		scatter memvar memo
		m.addmode = .f.
		m.oldkey = m.prekey
		do loadkid with &headfile->pos, ;
			'pos'
	endif
	m.prekey = ''
	do picklang
else
	if m.oldv2 = 'pos98' 
*	.and. !m.lookupmode
		do init
	endif	
endif

m.oldv2 = ''

show gets

	if m._lno = 'N'
		show get lno(1) disable
	else
		show get lno(1) enable
	endif

	if m._misc = 'N'
	  show get m.misc disable
	else
		show get m.misc enable
	endif
	
	if m._via = 'N'
	  show get m.via disable
	else
		show get m.via enable
	endif	  

	if m._company = 'N'
	  show get m.company disable
	else
	  show get m.company enable
	endif
	
	if m._employee = 'N'
	  show get m.employee disable
	else
	  show get m.employee enable
	endif

	if m._clients = 'N'
	  show get m.clients disable
	else
		show get m.clients enable
	endif
	
	if m._notepad = 'N'
	  show get m.notepad disable
	else
		show get m.notepad enable
	endif


if m.maxno = 1
  if empty(itemcode(1))
    if empty(name1(1))
      name1(1) = m.login
			show get name1(1)
    endif
  endif
endif