Name:         yajhfc
Summary:      Yet Another Java HylaFAX Client
Version:      §VERSION§
Release:      1
License:      GNU General Public License (GPL)
Group:        Hardware/Fax
Source:       yajhfc-%{version}-rpmsrc.tgz
URL:          http://www.yajhfc.de/
Vendor:       Jonas Wolz
BuildRoot:    %{_tmppath}/%{name}-%{version}-build
Requires:     java >= 1.5.0
BuildArch:    noarch

%description
YajHFC is a client program for the HylaFAX fax server, implemented in Java.

 Features:
   * Faxing documents in PostScript, PDF and various other formats
   * Polling faxes
   * Support for generating cover pages from templates
   * Viewing sent and received faxes
   * Phone book (entries can optionally be read from SQL databases or LDAP directories)
   * Visible table columns may be selected in a dialog
   * Supports nine languages: English, French, German, Greek, Italian, Polish, Russian, Spanish and Turkish

%package faxprinter
Summary:      Install a virtual fax printer for YajHFC
License:      GNU General Public License (GPL)
Requires:     yajhfc, cups
BuildArch:    noarch

%description faxprinter
This package installs a virtual fax printer in CUPS for YajHFC.

When a user prints to this printer, the output is redirected to YajHFC and
a "send fax" dialog is shown.

YajHFC must be running when a user wishes to print to the virtual fax printer.
Because of that, this package automatically adds an autostart link for all 
desktop environments conforming to the Free Desktop Menu Specification (e.g. KDE, GNOME, XFCE).

%prep
%setup -n yajhfc-§VERSION§
%build
sh build.sh
%install
sh install.sh "%{buildroot}"
sh install-faxprinter.sh "%{buildroot}"

%clean
%__rm -rf "%{buildroot}"

%files
%defattr(-, root, root)
%doc doc/README.txt doc/faq.pdf doc/COPYING
/usr/bin/yajhfc
/usr/share/yajhfc
/usr/share/applications/yajhfc.desktop
/usr/share/pixmaps/yajhfc.xpm
/usr/share/pixmaps/yajhfc.png
/usr/share/man/man1/yajhfc.1.gz


%post faxprinter
        if lpstat -p yajhfc >/dev/null 2>&1 ; then
	  echo 'YajHFC fax printer already exists.'
	else
       	  lpadmin -p yajhfc -D 'YajHFC virtual fax printer' -L 'localhost' -v 'yajhfc:/tmp/yajhfc-$USERNAME' -E -P /usr/share/yajhfc/yajhfc.ppd -o "printer-error-policy=abort-job" -o "printer-is-shared=false"
	  echo 'Virtual fax printer "yajhfc" created. (Re)Start YajHFC to fully enable it.'
	fi

%preun faxprinter
	lpadmin -x yajhfc || true
%files faxprinter
%defattr(-, root, root)
%doc doc/COPYING
/etc/yajhfc/settings.override
/etc/xdg/autostart/yajhfc-autostart.desktop
/usr/share/yajhfc/yajhfc.ppd
/usr/lib/cups/backend/yajhfc


%changelog
* Sun Nov 06 2011 - jonas@yajhfc.de
- Merged yajhfc.spec and yajhfc-faxprinter.spec 
* Sun Oct 16 2011 - jonas@yajhfc.de
- Changed homepage link 
* Tue Jan 05 2010 - jonas.wolz@freenet.de
- initial RPM for YajHFC on openSUSE 

