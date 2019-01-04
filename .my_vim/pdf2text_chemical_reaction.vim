" Since 2017/08/17
" Copyright 2017 Mamoru Kaminaga
" PDF paper reaction mechamism to text mechanism

function! Pdf2text()
  set hidden

  " "0" and "O", "4 -" and "+"
  :%s/+02+/+O2+/g
  :%s/0+/O+/g
  :%s/=\ 0/=O/g
  :%s/O\.0/0\.0/g
  :%s/O\.\n/0\./g
  :%s/O\n/0\n/g
  :%s/\.OO/\.00/g

  :%s/=0+H/=O+H/g
  :%s/=0+M/=O+M/g
  :%s/=0+N/=O+N/g
  :%s/=0+O/=O+O/g

  :%s/0+M/=O+M/g
  :%s/0+H/=O+H/g
  :%s/0+N/=O+N/g
  :%s/0+O/=O+O/g

  :%s/C0/CO/g
  :%s/M)+0/M)+O/g
  :%s/M+0/M+O/g
  :%s/C+0/C+O/g
  :%s/H+0/H+O/g
  :%s/N+0/N+O/g
  :%s/O+0/O+O/g
  :%s/C2+0/C2+O/g
  :%s/H2+0/H2+O/g
  :%s/N2+0/N2+O/g
  :%s/O2+0/O2+O/g
  :%s/H3+0/H3+O/g
  :%s/H4+0/H4+O/g
  :%s/H5+0/H5+O/g
  :%s/H6+0/H6+O/g

  :%s/M)=0/M)=O/g
  :%s/M=0/M=O/g
  :%s/C=0/C=O/g
  :%s/H=0/H=O/g
  :%s/N=0/N=O/g
  :%s/O=0/O=O/g
  :%s/C2=0/C2=O/g
  :%s/H2=0/H2=O/g
  :%s/N2=0/N2=O/g
  :%s/O2=0/O2=O/g
  :%s/H3=0/H3=O/g
  :%s/H4=0/H4=O/g
  :%s/H5=0/H5=O/g
  :%s/H6=0/H6=O/g

  " Species
  :%s/0H/OH/g
  :%s/0s/O2/g
  :%s/C,H,/C2H2/g
  :%s/C0/CO/g
  :%s/C=H,/C2H4/g
  :%s/CHs/CH2/g
  :%s/CHs0/CH2O/g
  :%s/CHuO/CH2O/g
  :%s/COs/CO2/g
  :%s/C\~H\~/C2H2/g
  :%s/Ca11s/C2H6/g
  :%s/CsH,/C2H4/g
  :%s/CsH/C2H/g
  :%s/CsH2/C2H6/g
  :%s/CsH\./C2H4/g
  :%s/C\~H\~/C2H2/g
  :%s/H02/HO2/g
  :%s/H20/H2O/g
  :%s/H7/H2/g
  :%s/HCGO/HCCO/g
  :%s/HOs/HO2/g
  :%s/HOt/HO2/g
  :%s/Ha/H2/g
  :%s/Hr/H2/g
  :%s/Hs/H2/g
  :%s/HuO/H2O/g
  :%s/H202/H2O2/g

  " Common miss conversion
  :%s/÷/+/g
  :%s/4\ -(M/+(M/g
  :%s/4\ -C/+C/g
  :%s/4\ -H/+H/g
  :%s/4\ -M/+M/g
  :%s/4\ -N/+N/g
  :%s/4\ -O/+O/g
  :%s/e4\ -/E+/g
  :%s/e-\~/E+/g
  :%s/e+/E+/g
  :%s/e-/E-/g

  :%s/\ \~\ /=/g
  :%s/\ \~-\ /=/g
  :%s/\ H\ /=/g

  :%s/"2/=/g
  :%s/+=/=/g
  :%s/=-/=/g
  :%s/==/=/g
  :%s/-+/+/g
  :%s/--/+/g

  :%s/-I/-1/g
  :%s/0,/0/g
  :%s/2f/M/g
  :%s/=J/H/g
  :%s/I'I/H/g
  :%s/I't/H/g
  :%s/I0/10/g
  :%s/II/11/g
  :%s/IV/N/g
  :%s/J2/+/g
  :%s/\~/2/g
  :%s/l/1/g
  :%s/]/1/g
  :%s/q-/+/g
  :%s/r/2/g
  :%s/tt/H/g
  :%s/¢/E+/g
  :%s/\/V/N/g

  " Error fixment
  :%s/=\([0-9]*\)\.\([0-9]*\)E/+H\ \1\.\2E/g

  " Delete extra spaces around operators
  :%s/+\ */+/g
  :%s/\ *+/+/g
  :%s/=\ */=/g
  :%s/\ *=/=/g
  :%s/=>\ */=>/g
  :%s/\ *<=/<=/g

  " Fix comments
  :%s/2eaction/reaction/g

endfunction
