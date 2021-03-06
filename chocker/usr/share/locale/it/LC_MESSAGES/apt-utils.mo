??    :      ?  O   ?      ?  )   ?     #  "   ?     b     ?     ?     ?     ?     ?  1        5  ,   D  m   q  #   ?  (        ,     0     I     f  %   ?  '   ?     ?     ?     ?  #     "   +     N     d     ~     ?     ?  #   ?  "   ?  "   		  "   ,	  $   O	     t	  "   ?	  5   ?	  !   ?	     
     
     0
     B
  "   `
     ?
  ?   ?
  ?   &  &    ?   <  ?   ?  ?   ?     ?     ?     ?  !   ?  #   ?  ?    .   ?     ?  %   ?  %        6  '   G  (   o  $   ?  $   ?  :   ?       =   5  ?   s  5     B   7     z  #   ~  $   ?  %   ?  <   ?  =   *     h     z     ?  )   ?  /   ?  )     !   7     Y     x  &   ?  ,   ?  #   ?  #     #   4  %   X     ~  6   ?  4   ?  5        >     ^     ~  .   ?  *   ?  !   ?  ?       ?  %  ?  ?   ?&  ?   ?'  8  G(     ?)  '   ?)  #   ?)  #   ?)  0   ?)     +   #      
      6                            4           	                 2              /                   $   .         )             *          !   7       :         "   '                  0   ,                    8       9   &          5      (   -      1   3   %                %s has no binary override entry either
   %s has no override entry
   %s has no source override entry
   %s maintainer is %s not %s
  DeLink %s [%s]
  DeLink limit of %sB hit.
 *** Failed to link %s to %s Archive had no package field Archive has no control record Cannot get debconf version. Is debconf installed? Compress child Compressed output %s needs a compression set DB format is invalid. If you upgraded from an older version of apt, please remove and re-create the database. DB is old, attempting to upgrade %s DB was corrupted, file renamed to %s.old E:  E: Errors apply to file  Error processing contents %s Error processing directory %s Error writing header to contents file Failed to create IPC pipe to subprocess Failed to fork Failed to open %s Failed to read .dsc Failed to read the override file %s Failed to read while computing MD5 Failed to readlink %s Failed to rename %s to %s Failed to resolve %s Failed to stat %s IO to subprocess/file failed Internal error, failed to create %s Malformed override %s line %llu #1 Malformed override %s line %llu #2 Malformed override %s line %llu #3 Malformed override %s line %llu (%s) No selections matched Package extension list is too long Some files are missing in the package file group `%s' Source extension list is too long Tree walking failed Unable to get a cursor Unable to open %s Unable to open DB file %s: %s Unknown compression algorithm '%s' Unknown package record! Usage: apt-dump-solver

apt-dump-solver is an interface to store an EDSP scenario in
a file and optionally forwards it to another solver.
 Usage: apt-extracttemplates file1 [file2 ...]

apt-extracttemplates is used to extract config and template files
from debian packages. It is used mainly by debconf(1) to prompt for
configuration questions before installation of packages.
 Usage: apt-ftparchive [options] command
Commands: packages binarypath [overridefile [pathprefix]]
          sources srcpath [overridefile [pathprefix]]
          contents path
          release path
          generate config [groups]
          clean config

apt-ftparchive generates index files for Debian archives. It supports
many styles of generation from fully automated to functional replacements
for dpkg-scanpackages and dpkg-scansources

apt-ftparchive generates Package files from a tree of .debs. The
Package file contains the contents of all the control fields from
each package as well as the MD5 hash and filesize. An override file
is supported to force the value of Priority and Section.

Similarly apt-ftparchive generates Sources files from a tree of .dscs.
The --source-override option can be used to specify a src override file

The 'packages' and 'sources' command should be run in the root of the
tree. BinaryPath should point to the base of the recursive search and 
override file should contain the override flags. Pathprefix is
appended to the filename fields if present. Example usage from the 
Debian archive:
   apt-ftparchive packages dists/potato/main/binary-i386/ > \
               dists/potato/main/binary-i386/Packages

Options:
  -h    This help text
  --md5 Control MD5 generation
  -s=?  Source override file
  -q    Quiet
  -d=?  Select the optional caching database
  --no-delink Enable delinking debug mode
  --contents  Control contents file generation
  -c=?  Read this configuration file
  -o=?  Set an arbitrary configuration option Usage: apt-internal-planner

apt-internal-planner is an interface to use the current internal
installation planner for the APT family like an external one,
for debugging or the like.
 Usage: apt-internal-solver

apt-internal-solver is an interface to use the current internal
resolver for the APT family like an external one, for debugging or
the like.
 Usage: apt-sortpkgs [options] file1 [file2 ...]

apt-sortpkgs is a simple tool to sort package information files.
By default it sorts by binary package information, but the -s option
can be used to switch to source package ordering instead.
 W:  W: Unable to read directory %s
 W: Unable to stat %s
 Waited for %s but it wasn't there realloc - Failed to allocate memory Project-Id-Version: apt
Report-Msgid-Bugs-To: APT Development Team <deity@lists.debian.org>
PO-Revision-Date: 2019-03-04 11:05+0100
Last-Translator: Milo Casagrande <milo@milo.name>
Language-Team: Italian <tp@lists.linux.it>
Language: it
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n!=1);
X-Generator: Poedit 2.2.1
   %s non ha neppure un campo binario override
   %s non ha un campo override
   %s non ha un campo source override
   il responsabile di %s è %s non %s
  Delink %s [%s]
  Raggiunto il limite di DeLink di %sB.
 *** Collegamento di %s a %s non riuscito L'archivio non ha un campo "package" L'archivio non ha un campo "control" Impossibile trovare la versione di debconf. È installato? Sottoprocesso compresso L'output compresso %s necessita di un insieme di compressione Il formato del database non è valido. Se è stato eseguito l'aggiornamento da una vecchia versione di apt, rimuovere e ricreare il database. Il database è vecchio, tentativo di aggiornamento %s Il database era danneggiato, il file è stato rinominato in %s.old E:  E: Gli errori si applicano al file  Errore nell'elaborare i contenuti %s Errore nell'elaborare la directory %s Errore nella scrittura dell'intestazione nel file "contents" Creazione di una pipe IPC verso il sottoprocesso non riuscita Fork non riuscita Apertura di %s non riuscita Lettura di .dsc non riuscita Lettura del file override %s non riuscita Lettura durante l'elaborazione MD5 non riuscita Esecuzione di readlink su %s non riuscita Rinomina di %s in %s non riuscita Risoluzione di %s non riuscita Impossibile eseguire stat su %s I/O al sottoprocesso/file non riuscito Errore interno, creazione di %s non riuscita Override %s riga %llu malformato #1 Override %s riga %llu malformato #2 Override %s riga %llu malformato #3 Override %s riga %llu malformato (%s) Nessuna selezione corrisponde L'elenco dell'estensione del pacchetto è troppo lungo Mancano alcuni file nel file group di pacchetti "%s" L'elenco dell'estensione del sorgente è troppo lungo Visita dell'albero non riuscita Impossibile ottenere un cursore Impossibile aprire %s Impossibile aprire il file del database %s: %s Algoritmo di compressione "%s" sconosciuto Record del pacchetto sconosciuto. Usage: apt-dump-solver

apt-dump-solver è un'interfaccia per salvare su file uno scenario EDSP e
inviarlo, opzionalmente, a un altro risolutore.
 Uso: apt-extracttemplates FILE1 [FILE2 ...]

apt-extracttemplates è uno strumento per estrarre configurazioni e template dai
pacchetti debian. Viene utilizzato principalmente da debconf(1) per chiedere
all'utente parametri di configurazione prima di installare i pacchetti.
 Uso: apt-ftparchive [OPZIONI] COMANDO
Comandi: packages PERCORSO_AL_BINARIO [FILE_OVERRIDE [PREFISSO_PERCORSO]
         sources PERCORSO_AI_SORGENTI [FILE_OVERRIDE [PREFISSO_PERCORSO]
         contents PERCORSO
         release PERCORSO
         generate CONFIGURAZIONE [GRUPPI]
         clean CONFIGURAZIONE

apt-ftparchive genera file di indice per gli archivi Debian. Supporta
molti stili di generazione da completamente automatici ad alternative
funzionali per dpkg-scanpackages e dpkg-scansources

apt-ftparchive genera file Packages da un albero di ".deb". Il file
Package contiene le informazioni di tutti i campi control da ogni
pacchetto, così come l'hash MD5 e la dimensione del file. Un file override
è supportato per forzare i valori di priorità e sezione.

Similmente, apt-ftparchive genera file Sources da un albero di .dscs.
L'opzione --source-override può essere usata per specificare un file
di override per i sorgenti

I comandi "packages" e "sources" devono essere eseguiti nella root 
dell'albero. Il percorso al binario deve puntare alla base della ricerca 
ricorsiva e il file override deve contenere le opzioni di override.
Il prefisso del percorso è aggiunto al campo filename se presente. Esempio
di utilizzo dall'archivio Debian:
   apt-ftparchive packages dists/potato/main/binary-i386/ > \
               dists/potato/main/binary-i386/Packages 

Opzioni:
  -h          Mostra questo aiuto
  --md5       Controlla la generazione dell'MD5
  -s=?        File override dei sorgenti
  -q          Silenzioso
  -d=?        Seleziona il database di cache opzionale
  --no-delink Abilita la modalità di debug del delinking
  --contents  Controlla la generazione del file "contents"
  -c=?        Legge come configurazione il file specificato
  -o=?        Imposta un'opzione arbitraria di configurazione Uso: apt-internal-planner

apt-internal-planner è un'interfaccia per l'utilizzo del pianificatore di
installazione interno come pianificatore esterno per eseguire il debug degli
strumenti APT.
 Uso: apt-internal-solver

apt-internal-solver è un'interfaccia per l'utilizzo del resolver interno
come resolver esterno per eseguire il debug degli strumenti APT.

 Uso: apt-sortpkgs [OPZIONI] FILE1 [FILE2 ...]

apt-sortpkgs è un semplice strumento per l'ordinamento dei file di informazione
dei pacchetti. Per impostazione predefinita ordina in base alle informazioni
sui pacchetti binari, ma tramite l'opzione -s è possibile passare
all'ordinamento sui pacchetti sorgenti.
 A:  A: Impossibile leggere la directory %s
 A: Impossibile eseguire stat su %s
 In attesa di %s ma non era presente realloc - Allocazione della memoria non riuscita 