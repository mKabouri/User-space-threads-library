import subprocess
import matplotlib.pyplot as plt
import time

x_values = list(range(1, 101)) # Valeurs de x à tester
num_executions = 20 # Nombre d'exécutions pour chaque valeur de x
times_01_main = [] # Temps pris pour exécuter chaque commande 01-main
times_51_fibonacci = [] # Temps pris pour exécuter chaque commande 51-fibonacci

for x in x_values:
    avg_time_01_main = 0.0
    avg_time_51_fibonacci = 0.0
    
    for _ in range(num_executions):
        # Mesure du temps pris pour exécuter la commande 01-main
        start_time = time.time()
        output = subprocess.run(['../install/bin/21-create-many', str(x)], capture_output=True)
        end_time = time.time()
        avg_time_01_main += (end_time - start_time) / num_executions
        
        # Mesure du temps pris pour exécuter la commande 21-create-many
        start_time = time.time()
        output = subprocess.run(['../install/bin_pthread/21-create-many', str(x)], capture_output=True)
        end_time = time.time()
        avg_time_51_fibonacci += (end_time - start_time) / num_executions
    
    times_01_main.append(avg_time_01_main)
    times_51_fibonacci.append(avg_time_51_fibonacci)

# Tracer le graphe
fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(x_values, times_01_main, label='bin/21-create-many', linewidth=2)
ax.plot(x_values, times_51_fibonacci, label='bin_pthread/21-create-many', linewidth=2)
ax.set_xlabel('nombre de thread', fontsize=14)
ax.set_ylabel('Temps d\'exécution (s)', fontsize=14)
ax.set_yscale('log')
ax.set_title('21-create-many', fontsize=16)
ax.legend(fontsize=12)
ax.grid(True)
plt.savefig('create_many.png')  # Enregistrer le schéma en tant qu'image
plt.show()
