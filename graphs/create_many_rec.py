import subprocess
import matplotlib.pyplot as plt
import time

x_values = list(range(1, 1000)) # Valeurs de x à tester
times_01_main = [] # Temps pris pour exécuter chaque commande 01-main
times_51_fibonacci = [] # Temps pris pour exécuter chaque commande 51-fibonacci

for x in x_values:
    # Mesure du temps pris pour exécuter la commande 01-main
    test = []
    for i in range (10) :
        start_time = time.time()
        output = subprocess.run(['../install/bin/22-create-many-recursive', str(x)], capture_output=True)
        end_time = time.time()
        test.append(end_time - start_time)
    times_01_main.append(sum(test)/len(test))
    
    # Mesure du temps pris pour exécuter la commande 51-fibonacci
    test2 = []
    for i in range (5) :
        start_time = time.time()
        output = subprocess.run(['../install/bin_pthread/22-create-many-recursive', str(x)], capture_output=True)
        end_time = time.time()
        test2.append(end_time - start_time)
    times_51_fibonacci.append(sum(test2)/len(test2))

# Tracer le graphe
fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(x_values, times_01_main, label='bin/22-create-many-recursive', linewidth=2)
ax.plot(x_values, times_51_fibonacci, label='bin_pthread/22-create-many-recursive', linewidth=2)
ax.set_xlabel('nombre de thread', fontsize=14)
ax.set_ylabel('Temps d\'exécution (s)', fontsize=14)
ax.set_yscale('log')
ax.set_title('22-create-many', fontsize=16)
ax.legend(fontsize=12)
ax.grid(True)
plt.savefig('create_many_rec.png')
plt.show()
