import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Classe responsavel por gerenciar o banco de dados
class AppDatabase {
  // Cria uma Instância privada do banco de dados
  static final AppDatabase _instance = AppDatabase._internal();

  // Armazena a instância do banco de dados
  static Database? _database;

  // Construtor da fábrica que retorna sempre a mesma instância
  factory AppDatabase() {
    return _instance;
  }

  // Método para inicializar o banco de dados
  AppDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Método que inicializa o banco de dados, definindo o caminho e criando ou abrindo as tabelas necessárias
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Criação de tabelas abaixo
        if (kDebugMode) {
          print('Creating tables in the database...');
        }

        await db.execute('''
          CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            email TEXT UNIQUE,
            password TEXT,
            firstname TEXT,
            lastname TEXT,
            city TEXT,
            street TEXT,
            number INTEGER,
            zipcode TEXT,
            phone TEXT,
            lat TEXT,
            long TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS cart (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER,
            date TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS cart_products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            cartId INTEGER,
            productId INTEGER,
            quantity INTEGER,
            title TEXT,
            price REAL,
            imageUrl TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS favorite (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER,
            productId INTEGER,
            dataFavorito TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS rating (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER,
            productId INTEGER,
            rate REAL,
            count INTEGER,
            UNIQUE(userId, productId)
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS auth (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            token TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS orders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER,
            date TEXT,
            status TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS order_products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            orderId INTEGER,
            productId INTEGER,
            quantity INTEGER.
            price REAL
          )
        ''');
      },
    );
  }
}
