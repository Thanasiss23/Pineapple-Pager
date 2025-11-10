# Pineapple-Pager
DuckyScript/Bash Payloads

🍍 WiFi Pineapple Pager: Custom Payloads & Training Scripts
Αυτό το repository περιέχει μια συλλογή από DuckyScript και Bash Payloads που δημιουργήθηκαν για το WiFi Pineapple Pager. Τα scripts αυτά χρησιμοποιούν τις μοναδικές δυνατότητες του Pager, όπως το Alert-based Automation και τα ενσωματωμένα χαρακτηριστικά υλικού (LED, Buzzer, Vibrator), για την αυτοματοποίηση δοκιμών διείσδυσης (Penetration Testing) στον ασύρματο χώρο.

💻 Βασικά Payloads & Χαρακτηριστικά
1. 01_Recon_Engage: Στοχευμένη Επίθεση (Wi-Fi)
2. Targeted_Evil_Twin.sh: Αυτό το script εκτελεί ένα πλήρες σενάριο Evil Twin Attack χρησιμοποιώντας Alert-based Automation.
3. Εκτελεί MAC Spoofing για OpSec (επιχειρησιακή ασφάλεια).
4. Παραμένει σε αναμονή μέχρι να λάβει Probe Request για ένα προκαθορισμένο SSID.
5. Μόλις εντοπιστεί ο στόχος, ενεργοποιεί το Rogue AP και εκτελεί επίθεση Deauthentication για να εξαναγκάσει τη σύνδεση του client.
6. BT_RECON_SCANNER.sh: Payload για την αναγνώριση Bluetooth Low Energy (BTLE). Χρησιμοποιεί εντολές Bash (hcitool, grep) για να σαρώνει το ραδιοφάσμα και να καταγράφει διευθύνσεις και ονόματα συσκευών Bluetooth στον φάκελο loot.

🍍_Fun_Utilities: Έλεγχος Υλικού & Utilities
  Al_Dente_Presets.sh (Pasta Timer): Ένα διαδραστικό utility που επιδεικνύει τη χρήση των φυσικών πλήκτρων του Pager ως εισόδου χρήστη.
  
  Χρησιμοποιεί ON BUTTON_A_PRESSED και ON BUTTON_B_PRESSED για την επιλογή προκαθορισμένων χρόνων (8 ή 10 λεπτών).
  
  Παρέχει πλήρη ανατροφοδότηση μέσω LED, Buzzer και Δόνησης κατά την εκκίνηση και την ολοκλήρωση της αντίστροφης μέτρησης.
  
 Disco_Pager_Mode.sh: Ένα απλό script που χρησιμοποιεί ένα WHILE TRUE loop για την κυκλική εναλλαγή των ενδείξεων LED και του βομβητή (Buzzer) για την επίδειξη του ελέγχου υλικού.

   ⚠️ Προσοχή! (Disclaimer)
   Τα εργαλεία και τα scripts που περιέχονται σε αυτό το repository προορίζονται αποκλειστικά για εκπαιδευτικούς σκοπούς και για δοκιμές διείσδυσης σε δίκτυα για τα οποία έχετε ρητή, γραπτή άδεια από τον ιδιοκτήτη. Η μη εξουσιοδοτημένη χρήση αυτών των τεχνικών είναι παράνομη και ανήθικη. Ο χρήστης φέρει την αποκλειστική ευθύνη για τη χρήση τους.
