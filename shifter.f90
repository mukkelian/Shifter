! This program can be used to manipuate the dimension/shift the
! lattice system.
! Copyright (C) 2021  Mukesh Kumar Sharma, Department of Physics,
! Indian Institute of Technology Roorkee, Uttrakhand, India, PIN code 247667

! This program is free software; you can redistribute it and/or
! modify it under the terms of the GNU General Public License
! as published by the Free Software Foundation; either version 2
! of the License, or (at your option) any later version.

! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with this program; if not, write to the Free Software
! Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

!       UPDATE :: Jul 7 2021 2:48 PM
!	~ Mukelian
	character(len=20)::title
	character(len=3), allocatable :: a(:)
	real, allocatable :: x1(:), y1(:), z1(:)
	real la,lb,lc,amt
	integer n
	character opt,opt1,opt2
	open(1,file='a.xyz',status='unknown')
	open(2,file='b.xyz',status='unknown')
	print*,"Enter the value of lattice constants to project 'a,b,c'"
	read*,la,lb,lc
	read(1,*) n
	read(1,*)title
	
	allocate(a(n), x1(n),y1(n),z1(n))
	x1=0.; y1=0.; z1=0.
	do i=1,n
	read(1,*)a(i),x1(i),y1(i),z1(i)
	end do

	print*,'Do you want to shift the coorinates (y/n)'
	read*, opt
3	if(opt.eq.'y')then
	print*,'Along which axis ? x,y or z-axis '
	print*, 'Enter the axises !'
	read*,opt1
	print*, 'Enter the amount to shift (in Cart. Co-or.)'
	read*,amt
		if(opt1.eq.'x')then
		do i=1,n
		x1(i)=x1(i)+amt
		end do
		elseif(opt1.eq.'y')then
		do i=1,n
                y1(i)=y1(i)+amt
                end do
		elseif(opt1.eq.'z')then
                do i=1,n
                z1(i)=z1(i)+amt
                end do
		end if
	print*, 'Do you want to shift the axis again ? (y/n)'
	read*, opt2
	if(opt2.eq.'y')then
	opt=opt2 
	goto 3
	else
	print*,'Ok !'
	end if
!--------------------------making fractions for 'y' part
        do i=1,n
        x1(i)=x1(i)/la
        y1(i)=y1(i)/lb
        z1(i)=z1(i)/lc
        end do
!--------------------------
	elseif(opt.eq.'n')then
	do i=1,n
	x1(i)=x1(i)/la
	y1(i)=y1(i)/lb
	z1(i)=z1(i)/lc
	end do
	endif

	write(2,*)n
	write(2,*)title
	do i=1,n
	write(2,*)a(i),x1(i),y1(i),z1(i)
        end do
	print*,''
	print*, 'May the Force be with you!'
	print*,'~ Mukesh Kumar Sharma'
	print*,'e-mail :: msharma1@ph.iitr.ac.in'
	print*,''
	print*,''
	stop
	end
