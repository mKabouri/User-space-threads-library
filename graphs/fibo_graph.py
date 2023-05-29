import subprocess
import matplotlib.pyplot as plt
import time

x_values = list(range(10, 20)) # Valeurs de x à tester
times_01_main = [] # Temps pris pour exécuter chaque commande 01-main
times_51_fibonacci = [] # Temps pris pour exécuter chaque commande 51-fibonacci

for x in x_values:
    # Mesure du temps pris pour exécuter la commande 01-main
    start_time = time.time()
    output = subprocess.run(['../install/bin/51-fibonacci', str(x)], capture_output=True)
    end_time = time.time()
    times_01_main.append(end_time - start_time)
    
    # Mesure du temps pris pour exécuter la commande 51-fibonacci
    start_time = time.time()
    output = subprocess.run(['../install/bin_pthread/51-fibonacci', str(x)], capture_output=True)
    end_time = time.time()
    times_51_fibonacci.append(end_time - start_time)

# Tracer le graphe
fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(x_values, times_01_main, label='bin/51-fibonacci', linewidth=2)
ax.plot(x_values, times_51_fibonacci, label='bin_pthread/51-fibonacci', linewidth=2)
ax.set_xlabel('Valeur de x', fontsize=14)
ax.set_ylabel('Temps d\'exécution (s)', fontsize=14)
ax.set_title('Temps d\'exécution de 51-fibonacci', fontsize=16)
ax.legend(fontsize=12)
ax.grid(True)
plt.savefig('fibo.png')  # Enregistrer le schéma en tant qu'image
plt.show()
