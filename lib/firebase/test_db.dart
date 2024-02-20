import '../models/utilisateur.dart';
import 'utilisateur_service.dart';

class TestDB {
  static Future<void> testUtilisateurService() async {
    // Création d'une instance du service avec un ID utilisateur spécifique
    UtilisateurService utilisateurService = UtilisateurService(uid: '12359595');

    try {
      // Opération CREATE
      print('Creating user...');
      await utilisateurService.createUser('John Doe', '123 Main St', 5551234);
      print('User created successfully!');

      // Opération READ (Find one user by uid)
      print('\nFinding user...');
      Utilisateur? user = await utilisateurService.find();
      if (user != null) {
        print('User found: ${user.nom}, ${user.adresse}, ${user.numero}');
      } else {
        print('User not found');
      }

      // Opération UPDATE
      print('\nUpdating user...');
      await utilisateurService.updateUser('Jane Doe', '456 Side St', 5555678);
      print('User updated successfully!');

      // Opération READ (Find one user by uid) après la mise à jour
      print('\nFinding user after update...');
      user = await utilisateurService.find();
      if (user != null) {
        print('User found: ${user.nom}, ${user.adresse}, ${user.numero}');
      } else {
        print('User not found');
      }

      // Opération DELETE
      print('\nDeleting user...');
      await utilisateurService.deleteUser();
      print('User deleted successfully!');
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
    }
  }
}
