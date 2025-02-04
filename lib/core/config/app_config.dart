class AppConfig {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://lcovrrshqjpjlmenbtin.supabase.co',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxjb3ZycnNocWpwamxtZW5idGluIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg1NjMwNzQsImV4cCI6MjA1NDEzOTA3NH0.KG0iYe6lqKveNiHockx9L3OO7zRxXHtkNtOtXnoqV5I',
  );
}
